# frozen_string_literal: true

require 'action_dispatch/middleware/session/abstract_store'
require_relative '../../firebug/session'

module ActionDispatch
  module Session
    class CodeIgniterStore < AbstractStore
      def initialize(app, options={})
        super(app, options.merge!(key: 'default_pyrocms'))
      end

      # @param [ActionDispatch::Request] req
      # @param [Hash] session
      def find_session(req, session)
        session = Firebug.decrypt_cookie(session)
        model = find_session_model(req, session[:session_id])
        # Rack::Session::Abstract::Persisted#load_session expects this to return an Array with the first value being
        # the session ID and the second the actual session data.
        [model.session_id, model.user_data]
      end

      # @param [ActionDispatch::Request] req
      # @param [String] sid
      # @param [Hash] session
      # @param [Hash] _options
      # @return [String]
      def write_session(req, sid, session, _options)
        model = find_session_model(req, sid)
        model_params = { session_id: sid, user_data: session, last_activity: Time.current.to_i }
        # Returning false will cause Rack to output a warning.
        return false unless model.update(model_params)
        # Return the encrypted cookie format of the data. Rack sets this value as the cookie in the response
        model.cookie_data
      end

      # @param [ActionDispatch::Request] req
      # @param [String] sid
      # @param [Hash] _options
      # @return [String] the new session id
      def delete_session(req, sid, _options)
        # Get the current database record for this session then delete it.
        find_session_model(req, sid).delete
        # Generate a new one and return it's ID
        find_session_model(req).session_id
      end

      private

      # @param [ActionDispatch::Request] req
      # @param [String] sid
      # @return [Firebug::Session]
      def find_session_model(req, sid=nil)
        model = Firebug::Session.find_by(session_id: sid)
        return model if model
        Firebug::Session.create(
          session_id: sid || generate_sid,
          last_activity: Time.current.to_i,
          user_agent: req.user_agent,
          ip_address: req.remote_ip
        )
      end
    end
  end
end