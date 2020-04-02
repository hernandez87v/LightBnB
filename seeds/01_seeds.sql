--  $2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u. 
-- USERS
INSERT INTO users (id, name, email, password) 
VALUES (1, 'Armand Hilll', 'lera_hahn@dickens.org','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) 
VALUES (2, 'Stephanie Wolff', 'darius.homenick@tod.ca','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) 
VALUES (3, 'Stan Miller', 'mcdermott.maxie@schoen.com','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) 
VALUES (4, 'Elliot Dickinson', 'derrick_pollich@gmail.com','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) 
VALUES (5, 'Lloyd Boehm', 'ebba.deckow@yahoo.com','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) 
VALUES (6, 'Erna Cassin', 'miguel.barrows@yahoo.com','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
INSERT INTO users (id, name, email, password) 
VALUES (7, 'Edison Brown', 'alysha.daniel@boyer.tv','$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');
-- PROPERTIES
INSERT INTO properties (owner_id, title,thumbnail_photo_url,cover_photo_url,cost_per_night,parking_spaces,number_of_bathrooms,number_of_bedrooms, country, street, city, province, postal_code, active)
VALUES (1,'Speed Lamp','description','https://images.pexels.com/photos/3958954/pexels-photo-3958954.jpeg?cs=srgb&dl=white-and-blue-wooden-house-3958954.jpg&fm=jpg','https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=blue-and-gray-concrete-house-with-attic-during-twilight-186077.jpg&fm=jpg',85234,6,6,7,'Canada', '651 Nami Road', 'Bohbatev', 'Alberta', '83680', true),(2,'Blank Corner','description','https://images.pexels.com/photos/3958954/pexels-photo-3958954.jpeg?cs=srgb&dl=white-and-blue-wooden-house-3958954.jpg&fm=jpg','https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=blue-and-gray-concrete-house-with-attic-during-twilight-186077.jpg&fm=jpg',6598,4,4,6,'Canada', '589 Monk Road', 'Bob', 'Alberta', '6635', true),(3,'Oasis','description','https://images.pexels.com/photos/3958954/pexels-photo-3958954.jpeg?cs=srgb&dl=white-and-blue-wooden-house-3958954.jpg&fm=jpg','https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=blue-and-gray-concrete-house-with-attic-during-twilight-186077.jpg&fm=jpg',6668,3,4,4,'Canada', '444 Montreal Road', 'Vancouver', 'British Columbia', '99948', true),(4,'Game Fill','description','https://images.pexels.com/photos/3958954/pexels-photo-3958954.jpeg?cs=srgb&dl=white-and-blue-wooden-house-3958954.jpg&fm=jpg','https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=blue-and-gray-concrete-house-with-attic-during-twilight-186077.jpg&fm=jpg',2358,2,2,2,'Canada', '253 Gummy Road', 'Careville', 'British Columbia', '2569', true),(5,'Helio Place','description','https://images.pexels.com/photos/3958954/pexels-photo-3958954.jpeg?cs=srgb&dl=white-and-blue-wooden-house-3958954.jpg&fm=jpg','https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=blue-and-gray-concrete-house-with-attic-during-twilight-186077.jpg&fm=jpg',7569,5,6,7,'Canada', '777 Hef Street', 'Cherib', 'Alberta', '8544', true),(6,'Bunk Villa','description','https://images.pexels.com/photos/3958954/pexels-photo-3958954.jpeg?cs=srgb&dl=white-and-blue-wooden-house-3958954.jpg&fm=jpg','https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=blue-and-gray-concrete-house-with-attic-during-twilight-186077.jpg&fm=jpg',999,1,1,1,'Canada', '123 Robb Road', 'Bunksville', 'Alberta', '5974', true),(7,'Shwing Shwum','description','https://images.pexels.com/photos/3958954/pexels-photo-3958954.jpeg?cs=srgb&dl=white-and-blue-wooden-house-3958954.jpg&fm=jpg','https://images.pexels.com/photos/186077/pexels-photo-186077.jpeg?cs=srgb&dl=blue-and-gray-concrete-house-with-attic-during-twilight-186077.jpg&fm=jpg',98576,8,9,9,'Canada', '968 Heavin Road', 'Pron', 'British Columbia', '5874', true);
-- RESERVATIONS
INSERT INTO reservations (guest_id, property_id, start_date, end_date) 
VALUES (1, 1, '2018-09-11', '2018-09-26'),
(2, 2, '2019-01-04', '2019-02-01'),
(3, 3, '2022-10-01', '2021-10-14'),
(4, 4, '2020-05-08', '2023-11-30'),
(5, 5, '2017-02-05', '2022-05-23'),
(6, 6, '2016-06-04', '2026-01-03'),
(7, 7, '2019-12-09', '2024-06-16');
-- PROPERTY REVIEWS
INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (2,5,4,3,'messages'), (7,2,1,2,'messages'),(1,6,5,4,'messages'),(6,7,7,5,'messages'),(4,5,6,5,'messages');