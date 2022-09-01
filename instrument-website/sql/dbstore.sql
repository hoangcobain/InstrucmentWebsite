use dbstore;

CREATE TABLE role(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    createddate TIMESTAMP NULL,
    modifieddate TIMESTAMP NULL,
    createdby VARCHAR(255) NULL,
    modifiedby VARCHAR(255) NULL
);

CREATE TABLE user(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    fullname VARCHAR(255) NULL,
    status int NOT NULL,
    roleid bigint NOT NULL,
    createddate TIMESTAMP NULL,
    modifieddate TIMESTAMP NULL,
    createdby VARCHAR(255) NULL,
    modifiedby VARCHAR(255) NULL
);
ALTER TABLE user ADD CONSTRAINT fk_user_role FOREIGN KEY (roleid) REFERENCES role(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE orders (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  userid bigint NOT NULL,
  phone varchar(20) NOT NULL,
  email varchar(50) NOT NULL,
  address VARCHAR(255) NOT NULL,
  total bigint NOT NULL,
  createddate TIMESTAMP NULL,
  status int NOT NULL
);
ALTER TABLE orders ADD CONSTRAINT fk_user_order FOREIGN KEY (userid) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE product(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    name VARCHAR(255) NULL,
    brand VARCHAR(255) NULL,
    made VARCHAR(255) NULL,
    description TEXT NULL,
    amount int NOT NULL,
    price bigint NOT NULL,
    categoryid bigint NOT NULL,
    createddate TIMESTAMP NULL,
    modifieddate TIMESTAMP NULL,
    createdby VARCHAR(255) NULL,
    modifiedby VARCHAR(255) NULL
);

CREATE TABLE category(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    createddate TIMESTAMP NULL,
    modifieddate TIMESTAMP NULL,
    createdby VARCHAR(255) NULL,
    modifiedby VARCHAR(255) NULL
);
ALTER TABLE product ADD CONSTRAINT fk_product_category FOREIGN KEY (categoryid) REFERENCES category(id) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE item (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  quantity int NOT NULL,
  price bigint NOT NULL,
  productid bigint NOT NULL,
  orderid bigint NOT NULL
);
ALTER TABLE item ADD CONSTRAINT fk_orders_item FOREIGN KEY (orderid) REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE item ADD CONSTRAINT fk_orders_product FOREIGN KEY (productid) REFERENCES product(id) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE picture (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  picture text COLLATE utf8_unicode_ci NOT NULL,
  productid bigint NOT NULL
);
ALTER TABLE picture ADD CONSTRAINT fk_product_picture FOREIGN KEY (productid) REFERENCES product(id) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE comment(
	id bigint NOT NULL PRIMARY KEY auto_increment,
    content TEXT NOT NULL,
    userid bigint NOT NULL,
    productid bigint NOT NULL,
    createddate TIMESTAMP NULL,
    modifieddate TIMESTAMP NULL,
    createdby VARCHAR(255) NULL,
    modifiedby VARCHAR(255) NULL
);
ALTER TABLE comment ADD CONSTRAINT fk_comment_product FOREIGN KEY (productid) REFERENCES product(id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE comment ADD CONSTRAINT fk_comment_user FOREIGN KEY (userid) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE;



