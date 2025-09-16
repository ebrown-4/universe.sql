DROP DATABASE IF EXISTS universe;
CREATE DATABASE universe;

\c universe

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_type VARCHAR(20) NOT NULL,
    number_of_stars INT NOT NULL,
    distance_from_earth INT NOT NULL,
    description TEXT,
    has_supermassive_blackhole BOOLEAN NOT NULL
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    mass NUMERIC NOT NULL,
    radius INT NOT NULL,
    hot BOOLEAN NOT NULL,
    spectral_type VARCHAR(10)
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    distance_from_star INT NOT NULL,
    radius INT NOT NULL,
    is_habitable BOOLEAN NOT NULL,
    planet_type VARCHAR(20),
    moons_count INT NOT NULL,
    age_millions INT NOT NULL
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    diameter INT NOT NULL,
    has_atmosphere BOOLEAN NOT NULL,
    discovered_by VARCHAR(50),
    orbit_days INT NOT NULL,
    is_tidally_locked BOOLEAN NOT NULL
);

CREATE TABLE asteroid (
    asteroid_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    diameter INT NOT NULL,
    composition VARCHAR(20),
    distance_from_sun INT NOT NULL,
    is_potentially_hazardous BOOLEAN NOT NULL,
    discovery TEXT
);

INSERT INTO galaxy (name, galaxy_type, number_of_stars, distance_from_earth, description, has_supermassive_blackhole)
VALUES
('Milky Way', 'Spiral', 250000000000, 0, 'Our home galaxy', TRUE),
('Andromeda', 'Spiral', 1000000000000, 2537000, 'Closest large galaxy', TRUE),
('Triangulum', 'Spiral', 40000000000, 3000000, 'Small spiral galaxy', FALSE),
('Messier 87', 'Elliptical', 2000000000, 53000000, 'Contains a huge black hole', TRUE),
('Sombrero', 'Spiral', 80000000000, 29000000, 'Distinctive shape', TRUE),
('Whirlpool', 'Spiral', 100000000000, 23000000, 'Beautiful spiral', TRUE);

INSERT INTO star (name, galaxy_id, mass, radius, hot, spectral_type)
VALUES
('Sun', 1, 1.0, 109, TRUE, 'G2V'),
('Proxima Centauri', 2, 0.12, 14, FALSE, 'M5.5V'),
('Sirius', 1, 2.02, 120, TRUE, 'A1V'),
('Betelgeuse', 1, 20.0, 887, TRUE, 'M2Iab'),
('Rigel', 1, 21.0, 78, TRUE, 'B8Iab'),
('Vega', 1, 2.1, 10, TRUE, 'A0V');

INSERT INTO planet (name, star_id, distance_from_star, radius, is_habitable, planet_type, moons_count, age_millions)
VALUES
('Earth', 1, 150, 6371, TRUE, 'Terrestrial', 1, 4500),
('Mars', 1, 228, 3389, FALSE, 'Terrestrial', 2, 4500),
('Venus', 1, 108, 6051, FALSE, 'Terrestrial', 0, 4500),
('Jupiter', 1, 778, 69911, FALSE, 'Gas Giant', 79, 4500),
('Saturn', 1, 1429, 58232, FALSE, 'Gas Giant', 82, 4500),
('Mercury', 1, 58, 2439, FALSE, 'Terrestrial', 0, 4500),
('Proxima b', 2, 7, 7160, FALSE, 'Terrestrial', 0, 4500),
('Sirius c', 3, 500, 7000, FALSE, 'Gas Giant', 1, 3000),
('Betelgeuse b', 4, 1000, 8000, FALSE, 'Gas Giant', 0, 10000),
('Rigel b', 5, 1200, 9000, FALSE, 'Gas Giant', 2, 12000),
('Vega b', 6, 1300, 9500, FALSE, 'Gas Giant', 1, 9000),
('Mars II', 1, 250, 3500, FALSE, 'Terrestrial', 0, 4500);

INSERT INTO moon (name, planet_id, diameter, has_atmosphere, discovered_by, orbit_days, is_tidally_locked)
VALUES
('Moon', 1, 3475, TRUE, 'Galileo', 27, TRUE),
('Phobos', 2, 22, FALSE, 'Asaph Hall', 0, TRUE),
('Deimos', 2, 12, FALSE, 'Asaph Hall', 1, TRUE),
('Europa', 4, 3122, TRUE, 'Galileo', 3, TRUE),
('Ganymede', 4, 5268, TRUE, 'Galileo', 7, TRUE),
('Callisto', 4, 4820, TRUE, 'Galileo', 16, TRUE),
('Io', 4, 3643, TRUE, 'Galileo', 2, TRUE),
('Titan', 5, 5150, TRUE, 'Huygens', 16, TRUE),
('Rhea', 5, 1528, FALSE, 'Cassini', 4, TRUE),
('Iapetus', 5, 1490, FALSE, 'Cassini', 8, TRUE),
('Dione', 5, 1123, FALSE, 'Cassini', 2, TRUE),
('Tethys', 5, 1060, FALSE, 'Cassini', 1, TRUE),
('Enceladus', 5, 504, TRUE, 'Cassini', 1, TRUE),
('Miranda', 6, 471, FALSE, 'Voyager 2', 1, TRUE),
('Ariel', 6, 1158, FALSE, 'Voyager 2', 2, TRUE),
('Umbriel', 6, 1169, FALSE, 'Voyager 2', 4, TRUE),
('Titania', 6, 1578, FALSE, 'Voyager 2', 8, TRUE),
('Oberon', 6, 1523, FALSE, 'Voyager 2', 13, TRUE),
('Triton', 6, 2700, TRUE, 'Voyager 2', 5, TRUE),
('Nereid', 6, 340, FALSE, 'Voyager 2', 360, TRUE),
('Proteus', 6, 420, FALSE, 'Voyager 2', 2, TRUE);

INSERT INTO asteroid (name, diameter, composition, distance_from_sun, is_potentially_hazardous, discovery)
VALUES
('Ceres', 945, 'Rocky', 414, FALSE, 'Giuseppe Piazzi'),
('Vesta', 525, 'Rocky', 353, FALSE, 'Heinrich Olbers'),
('Pallas', 512, 'Rocky', 414, FALSE, 'Heinrich Olbers'),
('Hygiea', 430, 'Rocky', 470, FALSE, 'Auguste Charlois'),
('Interamnia', 350, 'Rocky', 345, FALSE, 'P. T. de Ball');
