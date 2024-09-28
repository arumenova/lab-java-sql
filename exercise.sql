#Task 1
CREATE DATABASE course_plan;

USE course_plan;

CREATE TABLE course
(
    id           INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(50),
    title_course VARCHAR(50),
    word_count   INT(50),
    views        INT(50)
);

INSERT INTO course (id, name, title_course, word_count, views)
VALUES (4, 'Maria Charlotte', 'Best Paint colors', 814, 14),
       (5, 'Juan Perez', 'Small Space Decorating Tips', 1146, 221),
       (8, 'Maria Charlotte', 'Hot Accessories', 986, 105),
       (2, 'Maria Charlotte', 'Mixing Textures', 765, 22),
       (33, 'Juan Perez', 'Kitchen Refresh', 1242, 307),
       (25, 'Maria Charlotte', 'Homemade Art Hacks', 1002, 193),
       (63, 'Gemma Alcocer', 'Refinishing Wood Floors', 1571, 7542);

CREATE TABLE author(
                       name_author VARCHAR(50),
                       id_author INT AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO author(name_author, id_author)
VALUES ('Maria Charlotte',15),
       ('Juan Perez', 45),
       ('Gemma Alcocer', 89);

CREATE TABLE posts (
                       post_id INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(50) NOT NULL ,
                       w_count INT (50) NOT NULL,
                       views1 INT (50) NOT NULL,
                       id_author INT,
                       FOREIGN KEY (id_author) REFERENCES author (id_author)
);

INSERT INTO posts (post_id, title, w_count, views1, id_author)
VALUES (123, 'Best Paint colors', 814,14,15),
       (256, 'Small Space Decorating Tips',1146, 221,45),
       (285, 'Hot Accessories',986, 105,15),
       (869, 'Mixing Textures',765, 22, 45),
       (212, 'Kitchen Refresh',1242, 307, 45),
       (513, 'Homemade Art Hacks',1002, 193, 15),
       (365, 'Refinishing Wood Floors',1571, 7542, 89);

DROP TABLE course;