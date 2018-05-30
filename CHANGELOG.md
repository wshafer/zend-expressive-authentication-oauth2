# Changelog

All notable changes to this project will be documented in this file, in reverse chronological order by release.

## 0.4.3 - 2018-05-09

### Added

- Nothing.

### Changed

- Nothing.

### Deprecated

- Nothing.

### Removed

- Nothing.

### Fixed

- Removes auto-requiring of the encryption key via the configuration unless the default file
  actually exists and is readable. As the configuration is processed in every request, this is necessary
  to prevent issues when the file does not exist (e.g., if the user has specified an alternate location).

## 0.4.2 - 2018-05-09

### Added

- Nothing.

### Changed

- Nothing.

### Deprecated

- Nothing.

### Removed

- Nothing.

### Fixed

- Fixes an issue in the default configuration paths for public, private, and encryption keys,
  ensuring they will be based on the current working directory, and not the package directory.

## 0.4.1 - 2018-05-09

### Added

- [#30](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/30)
  adds the AuthenticationInterface to the config provider so OAuth2 works out of
  the box. Can always be overwritten in project configs.
- [#38](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/38)
  added the the `/oauth` route configuration in docs.

### Changed

- Nothing.

### Deprecated

- Nothing.

### Removed

- Nothing.

### Fixed

- [#21](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/21)
  fixes unknown user will throw an exception. When a user tries to use a
  username that doesn't exist in the database an exception is thrown instead of
  an invalid_credentials error.
- [#22](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/22)
  fixes exception thrown when client secret is missing. When a client id is used
  that has no client_secret in the database an exception is thrown instead of an
  invalid_client error.
- [#23](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/23)
  updates the token insert statements to match schema located in data/oauth2.php
- [#37](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/37)
  fixes issue with script to generate keys writes to vendor dir


## 0.4.0 - 2018-03-15

### Added

- [#9](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/9)
  adds support for PSR-15.

- [#13](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/13)
  adds `Zend\Expressive\Authentication\OAuth2\Entity\RevokableTrait`, which
  provides a way to flag whether or not a token has been revoked, and mimics
  traits from the upstream league/oauth2-server implementation.

- [#13](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/13)
  adds `Zend\Expressive\Authentication\OAuth2\Entity\TimestampableTrait`, which
  provides methods for setting and retrieving `DateTime` values representing
  creation and update timestamps for a token; it mimics traits from the upstream
  league/oauth2-server implementation.

- [#32](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/32)
  adds the ability to pull league/oauth2-server grant implementations from the
  container, providing factories for each grant type. It also adds the ability
  to selectively disable grant types via configuration.

### Changed

- Updates the repository to pin to zend-expressive-authentication `^0.4.0`.

- [#13](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/13)
  updates `Zend\Expressive\Authentication\OAuth2\Entity\AccessTokenEntity` to
  use the `RevokableTrait` and `TimestampableTrait`.

- [#13](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/13)
  updates `Zend\Expressive\Authentication\OAuth2\Entity\AuthCodeEntity` to
  use the `RevokableTrait`.

- [#13](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/13)
  updates `Zend\Expressive\Authentication\OAuth2\Entity\RefreshTokenEntity` to
  use the `RevokableTrait`.

- [#13](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/13)
  updates `Zend\Expressive\Authentication\OAuth2\Entity\ClientEntity` to
  use the `RevokableTrait` and `TimestampableTrait`. It also adds methods for
  setting and retrieving the client secret, personal access client, and password
  client.

- [#17](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/17)
  changes the constructor of each of the `Zend\Expressive\Authentication\OAuth2\OAuth2Adapter`
  and `Zend\Expressive\Authentication\OAuth2\OAuth2Middleware` classes to accept
  a callable `$responseFactory` instead of a `Psr\Http\Message\ResponseInterface`
  response prototype. The `$responseFactory` should produce a
  `ResponseInterface` implementation when invoked.

- [#17](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/17)
  updates the `OAuth2AdapterFactory` and `OAuth2MiddlewareFactory` classes to no
  longer use `Zend\Expressive\Authentication\ResponsePrototypeTrait`, and
  instead always depend on the `Psr\Http\Message\ResponseInterface` service to
  correctly return a PHP callable capable of producing a `ResponseInterface`
  instance.

### Deprecated

- Nothing.

### Removed

- [#9](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/9) and
  [#5](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/5)
  remove support for http-interop/http-middleware and
  http-interop/http-server-middleware.

### Fixed

- [#18](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/18)
  updates the default SQL shipped with the package in `data/oauth2.sql` for
  generating OAuth2 tables to ensure it works with MySQL 5.7+; the SQL will
  still work with older versions, as well as other relational databases.

## 0.3.1 - 2018-02-28

### Added

- Nothing.

### Changed

- Nothing.

### Deprecated

- Nothing.

### Removed

- Nothing.

### Fixed

- [#18](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/18)
  updates the default SQL shipped with the package in `data/oauth2.sql` for
  generating OAuth2 tables to ensure it works with MySQL 5.7+; the SQL will
  still work with older versions, as well as other relational databases.

## 0.3.0 - 2018-02-07

### Added

- [#11](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/11)
  adds support for zend-expressive-authentication 0.3.0.

### Changed

- Nothing.

### Deprecated

- Nothing.

### Removed

- Nothing.

### Fixed

- Nothing.

## 0.2.1 - 2017-12-11

### Added

- [#1](https://github.com/zendframework/zend-expressive-authentication-oauth2/pull/1)
  adds support for providing configuration for the cryptographic key. This may
  be done by providing any of the following via the `authentication.private_key`
  configuration:

  - A string representing the key.
  - An array with the following key/value pairs:
    - `key_or_path` representing either the key or a path on the filesystem to a key.
    - `pass_phrase` with the pass phrase to use with the key, if needed.
    - `key_permissions_check`, a boolean for indicating whether or not to verify
      permissions of the key file before attempting to load it.

### Changed

- Nothing.

### Deprecated

- Nothing.

### Removed

- Nothing.

### Fixed

- Nothing.

## 0.2.0 - 2017-11-28

### Added

- Adds support for zend-expressive-authentication 0.2.0.

### Changed

- Nothing.

### Deprecated

- Nothing.

### Removed

- Removes support for zend-expressive-authentication 0.1.0.

### Fixed

- Nothing.

## 0.1.0 - 2017-11-20

Initial release.

### Added

- Everything.

### Changed

- Nothing.

### Deprecated

- Nothing.

### Removed

- Nothing.

### Fixed

- Nothing.
