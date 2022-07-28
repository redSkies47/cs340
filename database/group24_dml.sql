/*
Steven Ruzicka
Jonathan Chan
Project Group 24 - Team JoSt
CS 340 - Intro to Databases
Project Step 3 Final - Data Manipulation Queries
*/


-- -----------------------------------------------------
-- Movies Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- add a new Movie
INSERT INTO Movies (movie_name, movie_description, rating_id, hall_number) VALUES (:movie_name, :movie_description, :rating_id_from_dropdown, :hall_number)

-- Read
-- get all Movies for the Movies table
SELECT movie_id, movie_name, movie_description, rating_id, hall_number
FROM Movies
INNER JOIN Ratings ON Ratings.rating_id = Movies.rating_id
ORDER BY movie_name

-- DELETE
-- delete a Movie's data
DELETE FROM Movies
WHERE movie_id = :movie_id_selected_from_movies_page_icon


-- -----------------------------------------------------
-- Genres Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- add a new Genre to the database
INSERT INTO Genres (genre) VALUES (:genre)

-- READ
-- get all Genres for the Genre table
SELECT genre_id, genre
FROM Genres
ORDER BY genre_id


-- -----------------------------------------------------
-- Movies_has_Genres Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- associate a Movie with a Genre (M-to-M relationship addition)
INSERT INTO Movies_has_Genres (movie_id, genre_id) VALUES (:movie_id_from_dropdown_Input, :genre_id_from_dropdown_Input)

-- READ
-- get all associations of Movies and Genres
SELECT movie_id, genre_id
FROM Movies_has_Genres


-- -----------------------------------------------------
-- Ratings Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- add a new Rating in the database
INSERT INTO Ratings (rating_description) VALUES (:rating_description)

-- READ
-- get all Ratings for the Ratings table
SELECT rating_id, rating_description
FROM Ratings
ORDER BY rating_id


-- -----------------------------------------------------
-- Shows Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- add a new Showing
INSERT INTO Shows (time_start, time_end, movie_id) VALUES (:time_start_from_datetime_input_selector, :time_end_from_datetime_input_selector, :movie_id_from_dropdown)

-- READ
-- get all Shows for the Shows table
SELECT show_id, time_start, time_end, movie_id
FROM Shows
INNER JOIN Movies ON Movies.movie_id = Shows.movie_id


-- -----------------------------------------------------
-- Tickets Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- add a new Ticket  (NULLable relationship between Tickets and Employees with employee_id)
INSERT INTO Tickets (ticket_count, ticket_type_id, seat_number, show_id, employee_id) VALUES (:ticket_count, :ticket_type_id_from_dropdown, :seat_number, :show_id_from_dropdown, employee_id_from_dropdown)

-- READ
-- get all Tickets for the Tickets table
SELECT ticket_id, ticket_count, ticket_type_id, seat_number, show_id, employee_id
FROM Tickets
INNER JOIN Ticket_Types ON Ticket_Types.ticket_type_id = Tickets.ticket_type_id  --ticket_type_name
INNER JOIN Shows ON Shows.show_id = Tickets.show_id  --time start, time end, movie id
INNER JOIN Movies ON Movies.movie_id = Shows.movie_id -- movie name


-- -----------------------------------------------------
-- Ticket_Types Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- add a new Ticket_Type
INSERT INTO Ticket_Types (ticket_type_name, ticket_price) VALUES (:ticket_type_name, :ticket_price)

-- READ
-- get all Ticket_Types for the Ticket_Types table
SELECT ticket_type_id, ticket_type_name, ticket_price
FROM Ticket_Types


-- -----------------------------------------------------
-- Concessions Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- add a new Concessions sale to the Concessions table
INSERT INTO Concessions (sale_datetime, price, employee_id) VALUES (:sale_datetime_uses_datetime_input, :price, :employee_id_from_dropdown)

-- READ
-- get all Concessions from the Concessions sales table
SELECT concessions_id, sale_datetime, price, employee_id
INNER JOIN Employees ON Employees.employee_id = Concessions.employee_id  -- use first name
FROM Concessions


-- -----------------------------------------------------
-- Items Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- add a new Item
INSERT INTO Items (item_id, item_cost, item_name) VALUES (:item_id_from_table, :item_cost, :item_name)

-- READ
-- get all Items for the Items table
SELECT item_id, item_cost, item_name
FROM Items

-- UPDATE
-- update an Item's data using data from the page's table
UPDATE Items SET item_id = :item_id_from_table, item_cost= :item_cost, item_name = :item_name

-- DELETE
-- delete an Item's data
DELETE FROM Items
WHERE item_id = :item_id_selected_from_item_page_icon


-- -----------------------------------------------------
-- Concessions_has_Items Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- associate a Concessions Sales with an Item (M-to-M relationship addition)
INSERT INTO Concessions_has_Items (concessions_id, item_id) VALUES (:concessions_id_from_dropdown_Input, :item_id_from_dropdown_Input)

-- READ
-- get all associations of Concessions and Items
SELECT concessions_id, item_id
FROM Concessions_has_Items

--UPDATE
--update the association between a Concession Sale and an Item (M-to-M relationship update)
UPDATE Concessions_has_Items SET concessions_id = :concessions_id_selected_from_Concessions_List AND item_id = :item_id_selected_from_Items_List


--DELETE
--dis-associate a Concession Sale from an Item (M-to-M relationship deletion)
DELETE FROM Concessions_has_Items WHERE concessions_id = :concessions_id_selected_from_Concessions_List AND item_id = :item_id_selected_from_Items_List


-- -----------------------------------------------------
-- Employees Data Manipulation Queries
-- -----------------------------------------------------

-- CREATE
-- add a new Employee
INSERT INTO Employees (first_name, last_name, email, phone_number, address, city, state, postal_code) VALUES (:first_name, :last_name, :email, :phone_number, :address, :city_default_text, :state_default_text, :postal_code_default_text)

-- READ
-- get all Employees for the Employees table
SELECT employee_id, first_name, last_name, email, phone_number, address, city, state, postal_code
FROM Employees
ORDER BY first_name

--READ
--provides the results for a search of Employee by first and last name (SEARCH)
SELECT employee_id, first_name, last_name, email, phone_number, address, city, state, postal_code
FROM Employees
WHERE first_name = :first_name_from_Input_text AND last_name =:last_name_from_Input_text

-- UPDATE
-- update an Employee's data using form input data
UPDATE Employees SET employee_id = :employee_id_from_table, first_name = :first_name, last_name = :last_name, email = :email, phone_number = :phone_number, address = :address, city = :city, state = :state, postal_code = :postal_code

-- DELETE
-- delete an Employee's data
DELETE FROM Employees
WHERE employee_id = :employee_id_selected_from_item_page_icon