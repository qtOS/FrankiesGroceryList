CREATE DATABASE hit_list_db;
\c hit_list_db
CREATE TABLE lists (id SERIAL PRIMARY KEY, amt INT, item VARCHAR(100), brand VARCHAR(175), reason VARCHAR(255));
CREATE TABLE accounts(id SERIAL PRIMARY KEY, user_name VARCHAR(255), user_email VARCHAR(255), password_digest VARCHAR(255) , is_admin BOOLEAN);
