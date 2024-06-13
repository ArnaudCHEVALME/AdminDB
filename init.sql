-- Create the database
CREATE DATABASE school
ENCODING 'UTF8';

-- Create the tables if they don't exist
CREATE TABLE IF NOT EXISTS Classes (
  id SERIAL PRIMARY KEY,
  class_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Students (
  id SERIAL PRIMARY KEY,
  lastname VARCHAR(255),
  firstname VARCHAR(255),
  class_id INT,
  FOREIGN KEY (class_id) REFERENCES Classes(id)
);

-- Insert data into the Classes table
INSERT INTO Classes (class_name)
VALUES
('s6_alt1'),
('s6_alt2');

-- Insert data into the Students table
INSERT INTO Students (lastname, firstname, class_id)
VALUES
('BLONDIEAU', 'GABIN', 1),
('CHU', 'THOMAS', 1),
('FERRY', 'LUCAS', 1),
('JOBST', 'GAETAN', 1),
('KORBI', 'ARGJENTIN', 1),
('LAGARDE', 'LOANN', 1),
('MAGNIN', 'TITOUAN', 1),
('MOUGENOT', 'VALENTIN', 1),
('PAULIN', 'MAXENCE', 1),
('RIAT', 'FELIX', 1),
('GUILLOU', 'AURELIEN', 1),
('CHEVALME', 'ARNAUD', 1),
('FOULON', 'HUGO', 1),
('BECHER', 'THOMAS', 2),
('CRAYSSAC', 'MAXIME', 2),
('FRECHIN', 'MAXENCE', 2),
('GRABER', 'SIMON', 2),
('KOHLER', 'JAROD', 2),
('LAVAL', 'BAPTISTE', 2),
('MEISTER', 'NICOLAS', 2),
('MOUMEN', 'TAHA', 2);

REVOKE ALL ON DATABASE school FROM PUBLIC;

CREATE ROLE readaccess;
GRANT CONNECT ON DATABASE school TO readaccess;
GRANT USAGE ON SCHEMA public TO readaccess;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readaccess;

CREATE ROLE adminaccess;
GRANT CONNECT ON DATABASE school TO adminaccess;
GRANT USAGE ON SCHEMA public TO adminaccess;
GRANT ALL ON ALL TABLES IN SCHEMA public TO adminaccess;

CREATE ROLE user0 WITH PASSWORD 'tp_db';
GRANT readaccess TO user0;

CREATE ROLE admin0 WITH PASSWORD 'tp_db';
GRANT adminaccess TO admin0;