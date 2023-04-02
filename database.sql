
-- @block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country VARCHAR(2)
);

-- @block
INSERT INTO Users (email, bio, country)
VALUES 
    ('hello@world.com','i love strangers!','US'),
    ('jane.doe1234@example.com','I am a web developer','CA'),
    ('john.smith5678@example.com','I love hiking and camping','US'),
    ('lisa.brown9012@example.com','I am a cat lover','GB'),
    ('mike.johnson3456@example.com','I am a software engineer','US'),
    ('jessica.wong7890@example.com','I enjoy playing tennis','HK');

-- @block
SELECT * FROM Users;

-- selecting two rows from the database table using limit 2
-- @block
SELECT email, id FROM Users
ORDER BY id ASC
LIMIT 2;

-- selecting rows with the country of US or the id is more than 1
-- @block
SELECT email, id, country FROM Users

WHERE country = 'US' AND id > 1

ORDER BY id ASC
LIMIT 2;

-- selecting rows with the country of US and the email starts with john
-- @block
SELECT email, id, country FROM Users

WHERE country = 'US' AND email LIKE 'h%'

ORDER BY id ASC
LIMIT 2;

-- @block
CREATE INDEX email_index ON Users(email);

-- @block
CREATE TABLE Rooms(
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
)
-- @block
INSERT INTO Rooms (owner_id, street) 
VALUES
    (1, 'san diego sailboat'),
    (1, 'nantucket cottage'),
    (1, 'vail cabin'),
    (1, 'sf cardboard box'),
    (1, 'california roadways')

-- @block
SELECT * FROM Users
INNER JOIN Rooms
On Rooms.owner_id = Users.id;

-- @block
SELECT * FROM Users
LEFT JOIN Rooms
On Rooms.owner_id = Users.id;

-- @block
SELECT * FROM Users
RIGHT JOIN Rooms
On Rooms.owner_id = Users.id;

-- @block
SELECT
    Users.id AS user_id,
    Rooms.id AS room_id,
    email,
    street
FROM Users
INNER JOIN Rooms ON Rooms.owner_id = Users.id;

-- @block
CREATE TABLE Bookings(
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
)
