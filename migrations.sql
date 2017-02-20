
CREATE DATABASE crud_users;
\c crud_users

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	email VARCHAR(50),
	password VARCHAR(30),
	avatar VARCHAR(255),
	about VARCHAR(255)
);