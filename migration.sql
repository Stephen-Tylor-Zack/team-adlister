USE team_adlister_db;

DROP TABLE IF EXISTS ads_cat;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE categories (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  category VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price INT UNSIGNED NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

CREATE TABLE ads_cat (
  ads_id INT UNSIGNED NOT NULL,
  cats_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (ads_id) REFERENCES ads(id)
        ON DELETE CASCADE,
  FOREIGN KEY (cats_id) REFERENCES categories(id)
        ON DELETE CASCADE
);

INSERT INTO categories (category)
VALUES ('Xbox'),
       ('Playstation'),
       ('Nintendo'),
       ('PC');

INSERT INTO ads (user_id, title, description, price, city, state)
VALUES (1, 'Halo 5: Guardians', 'First-person shooter, Xbox One.', 15, 'San Antonio', 'Texas'),
       (1, 'God of War', 'Action-adventure, rpg video game, PS4.', 35, 'San Antonio', 'Texas'),
       (2, 'Mario Kart 8', 'Cartoon, fantasy racing game, Nintendo Switch.', 40, 'Austin', 'Texas'),
       (2, 'Overwatch', 'Team based strategy first-person shooter.', 30, 'Austin', 'Texas');

INSERT INTO ads_cat(ads_id, cats_id)
VALUES (1, 1), (2, 2), (3, 3), (4, 4);

SELECT categories.category
FROM categories
  JOIN ads_cat
    ON ads_cat.cats_id = categories.id
WHERE cats_id IN (
  SELECT ads.id
  FROM ads
  WHERE ads.id = ads_cat.cats_id
);

SELECT *
FROM ads;

SELECT *
FROM ads_cat;

SELECT *
FROM categories;

SELECT *
FROM users;
