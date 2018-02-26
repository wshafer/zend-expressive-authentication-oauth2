DROP TABLE IF EXISTS oauth_auth_codes;
CREATE TABLE oauth_auth_codes (
    id VARCHAR(100),
    user_id INTEGER,
    client_id INTEGER,
    scopes TEXT NULL,
    revoked BOOLEAN,
    expires_at TIMESTAMP,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS oauth_access_tokens;
CREATE TABLE oauth_access_tokens (
    id VARCHAR(100),
    user_id VARCHAR(40) NULL,
    client_id VARCHAR(40),
    name VARCHAR(255) NULL,
    scopes TEXT NULL,
    revoked BOOLEAN,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    expires_at TIMESTAMP NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS idx1_oauth_access_tokens;
CREATE INDEX idx1_oauth_access_tokens ON oauth_access_tokens(user_id);

DROP TABLE IF EXISTS oauth_refresh_tokens;
CREATE TABLE oauth_refresh_tokens (
    id VARCHAR(100),
    access_token_id VARCHAR(100),
    revoked BOOLEAN,
    expires_at TIMESTAMP NULL,
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS idx1_oauth_refresh_tokens;
CREATE INDEX idx1_oauth_refresh_tokens ON oauth_refresh_tokens(access_token_id);

DROP TABLE IF EXISTS oauth_clients;
CREATE TABLE oauth_clients (
    name VARCHAR(40) NOT NULL,
    user_id INTEGER NULL,
    secret VARCHAR(100) NULL,
    redirect VARCHAR(255),
    personal_access_client BOOLEAN,
    password_client BOOLEAN,
    revoked BOOLEAN,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    PRIMARY KEY (name)
);

DROP TABLE IF EXISTS idx1_oauth_clients;
CREATE INDEX idx1_oauth_clients ON oauth_clients(user_id);

DROP TABLE IF EXISTS oauth_personal_access_clients;
CREATE TABLE oauth_personal_access_clients (
    client_id INTEGER,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL
);

DROP TABLE IF EXISTS idx1_oauth_personal_access_clients;
CREATE INDEX idx1_oauth_personal_access_clients ON oauth_personal_access_clients(client_id);

DROP TABLE IF EXISTS oauth_users;
CREATE TABLE oauth_users (
    username VARCHAR(40) NOT NULL,
    password VARCHAR(100) NOT NULL,
    first_name VARCHAR(80),
    last_name VARCHAR(80),
    PRIMARY KEY (username)
);

DROP TABLE IF EXISTS oauth_scopes;
CREATE TABLE oauth_scopes (
    id VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);
