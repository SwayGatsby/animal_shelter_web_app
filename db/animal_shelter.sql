DROP TABLE adoptions;
DROP TABLE customers;
DROP TABLE animals;

CREATE TABLE customers
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  email VARCHAR(255),
  address_line_1 VARCHAR(255) NOT NULL,
  address_line_2 VARCHAR(255),
  address_city VARCHAR(255) NOT NULL,
  address_post_code VARCHAR(10) NOT NULL
);

CREATE TABLE animals
(
  id SERIAL8 PRIMARY KEY,
  photo VARCHAR(255),
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  breed VARCHAR(255),
  admission_date DATE NOT NULL,
  adoptable BOOLEAN NOT NULL
);


CREATE TABLE adoptions
(
  id SERIAL8 PRIMARY KEY,
  customer_id INT8 REFERENCES customers(id),
  animal_id INT8 REFERENCES animals(id),
  date_adopted DATE,
  checkup_date DATE
);
