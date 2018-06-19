DROP TABLE books;
DROP TABLE publishers;
DROP TABLE genres;

CREATE TABLE publishers(
  id serial8 PRIMARY KEY,
  name varchar(255),
  address varchar(255),
  city varchar(255),
  region varchar(255),
  country VARCHAR(255),
  postcode VARCHAR(255),
  tel VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE genres(
  id serial8 PRIMARY KEY,
  name varchar(255)
);

CREATE TABLE books(
  id serial8 PRIMARY KEY,
  title varchar(255),
  author varchar(255),
  publication_year varchar(255),
  quantity INT8,
  publisher_id INT8 REFERENCES publishers(id) ON DELETE CASCADE,
  genre_id INT8 REFERENCES genres(id) ON DELETE CASCADE,
  wholesale_price DECIMAL(8, 3),
  retail_price DECIMAL(8, 3),
  url VARCHAR(255),
  summary VARCHAR(8000)
);
