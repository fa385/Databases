-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE books RESTART IDENTITY; -- replace with your own table name.
-- deletes all contents of table and resets s

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.
--do not want to mess with the actual data, but the test databses, so require another test database used for the spec_helper


INSERT INTO books (title, author_name) VALUES ('TKAM', 'Harper Lee');
INSERT INTO books (title, author_name) VALUES ('TPOBAW', 'Stephen Chobsky');
