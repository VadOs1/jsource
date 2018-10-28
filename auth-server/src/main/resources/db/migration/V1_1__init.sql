CREATE TABLE users (
  username VARCHAR(100) NOT NULL PRIMARY KEY,
  password VARCHAR(100) NOT NULL,
  enabled  BOOLEAN      NOT NULL
);

CREATE TABLE authority (
  id   BIGSERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE authorities (
  username  VARCHAR(100) NOT NULL  REFERENCES users (username),
  authority BIGINT       NOT NULL REFERENCES authority (id),
  PRIMARY KEY (username, authority)
);

INSERT INTO authority (name) VALUES ('ROLE_USER'), ('ROLE_ADMIN');

INSERT INTO users
VALUES  ('superkid-user', '$2a$10$.ClGiX/64Ki0tZJrAZbLzeoo5hAaCZVycBv9XdIWJdNmNL3WMX/6u', TRUE);
INSERT INTO authorities VALUES ('superkid-user', 1);
INSERT INTO authorities VALUES ('superkid-user', 2);