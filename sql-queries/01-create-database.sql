CREATE DATABASE petshop;

CREATE TABLE categories (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	uuid CHAR(36) NOT NULL,
	title VARCHAR(255) NOT NULL,
	slug VARCHAR(255) NOT NULL,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	PRIMARY KEY(id)
);

CREATE TABLE products (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	category_id BIGINT UNSIGNED NOT NULL,
	uuid CHAR(36) NOT NULL,
	title VARCHAR(255) NOT NULL,
	price DOUBLE(12,2) NOT NULL,
	description TEXT NOT NULL,
	metadata JSON NOT NULL,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP,
	PRIMARY KEY(id),
	FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE users (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	uuid CHAR(36) NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	password VARCHAR(255) NOT NULL,
	avatar CHAR(36) NOT NULL,
	address VARCHAR(255) NOT NULL,
	is_admin TINYINT(1) NOT NULL,
	is_marketing TINYINT(1) NOT NULL,
	phone_number VARCHAR(255),
	last_login_at TIMESTAMP,
	email_verified_at TIMESTAMP,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	PRIMARY KEY(id)
);

CREATE TABLE jwt_tokens (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	unique_id TEXT,
	user_id BIGINT UNSIGNED NOT NULL,
	token_title VARCHAR(255) NOT NULL,
	restrictions JSON,
	permissions JSON,
	last_used_at TIMESTAMP,
	refreshed_at TIMESTAMP,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	expires_at TIMESTAMP,
	PRIMARY KEY(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE payments (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	uuid CHAR(36) NOT NULL,
	type VARCHAR(255) NOT NULL,
	details JSON NOT NULL,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	PRIMARY KEY(id)
);

CREATE TABLE orders_statuses (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	uuid CHAR(36) NOT NULL,
	title VARCHAR(255) NOT NULL,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	PRIMARY KEY(id)
);

CREATE TABLE orders (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
	user_id BIGINT UNSIGNED NOT NULL,
	payment_id BIGINT UNSIGNED NOT NULL,
	order_status_id BIGINT UNSIGNED NOT NULL,
	uuid CHAR(36) NOT NULL,
	products JSON NOT NULL,
	address JSON NOT NULL,
	amount DOUBLE(12,2) NOT NULL,
	delivery_fee DOUBLE(8,2),
	shipped_at TIMESTAMP,
	created_at TIMESTAMP,
	updated_at TIMESTAMP,
	PRIMARY KEY(id),
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (payment_id) REFERENCES payments(id),
	FOREIGN KEY (order_status_id) REFERENCES orders_statuses(id)
);
