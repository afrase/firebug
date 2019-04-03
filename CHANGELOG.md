# 1.2.2

* Fix for reading multibyte characters.
* Added a test for the multibyte character bug.
* Added tests for silence logger
* Renamed `Firebug::FirebugError` to `Firebug::Error`.

# 1.2.1

* Fixed nested empty hash bug and added a test for it.
* Added more documentation.

# 1.2.0

* Rewrote `Firebug::Unserializer` to use `StringIO` instead of `StringScanner`.
  In most cases this results in a 10x performance increase.
* Updated `.ruby-version` and `Dockerfile` to use Ruby 2.6
* Updated development dependencies.