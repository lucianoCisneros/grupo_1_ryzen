-- CREATE SCHEMA ryzen;

USE ryzen;

CREATE TABLE users(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(255),
lastName VARCHAR(255),
username VARCHAR(255) UNIQUE NOT NULL,
email VARCHAR(255) NOT NULL UNIQUE,
avatar VARCHAR(255),
password VARCHAR(255) NOT NULL,
rol TINYINT DEFAULT 0,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME ON UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME
);

CREATE TABLE products(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
description TEXT,
price DECIMAL NOT NULL,
brand VARCHAR(255),
img VARCHAR(255) NOT NULL,
idCategory INT UNSIGNED NOT NULL,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME ON UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME
);

CREATE TABLE categories(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
description TEXT,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME ON UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME
);

CREATE TABLE items(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
idUser INT UNSIGNED NOT NULL,
name VARCHAR(255),
description TEXT,
price DECIMAL,
quantity INT,
totalPrice DECIMAL,
status INT DEFAULT 0,
idCart INT UNSIGNED NULL,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME ON UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME
);

CREATE TABLE carts(
id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
idUser INT UNSIGNED NOT NULL,
cartNumber INT,
total INT DEFAULT 0,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME ON UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME
);


ALTER TABLE products
ADD FOREIGN KEY (idCategory) REFERENCES categories(id);

ALTER TABLE items
ADD FOREIGN KEY (idUser) REFERENCES users(id);

ALTER TABLE items
ADD FOREIGN KEY (idCart) REFERENCES carts(id);

ALTER TABLE carts
ADD FOREIGN KEY (idUser) REFERENCES users(id);