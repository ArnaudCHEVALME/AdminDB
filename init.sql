CREATE DATABASE school
ENCODING 'UTF8';

\c school;

-- Create the classes table
CREATE TABLE IF NOT EXISTS classes (
  id SERIAL PRIMARY KEY,
  class_name VARCHAR(255)
);

-- Create the students table
CREATE TABLE IF NOT EXISTS students (
  id SERIAL PRIMARY KEY,
  lastname VARCHAR(255),
  firstname VARCHAR(255),
  class_id INT,
  FOREIGN KEY (class_id) REFERENCES classes(id)
);

-- Insert data into the classes table
INSERT INTO classes (class_name)
VALUES
('s6_alt1'),
('s6_alt2');

-- Insert data into the students table
INSERT INTO students (lastname, firstname, class_id)
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

CREATE USER spectator WITH PASSWORD 'password';
CREATE USER owner_user WITH PASSWORD 'password';
CREATE USER admin_user WITH PASSWORD 'password';

GRANT CONNECT ON DATABASE school TO spectator;
GRANT USAGE ON SCHEMA public TO spectator;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO spectator;

GRANT CONNECT ON DATABASE school TO owner_user;
GRANT USAGE ON SCHEMA public TO owner_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO owner_user;
GRANT USAGE, SELECT, UPDATE ON ALL SEQUENCES IN SCHEMA public TO owner_user;

ALTER DATABASE school OWNER TO owner_user;
ALTER TABLE classes OWNER TO owner_user;
ALTER TABLE students OWNER TO owner_user;

ALTER USER admin_user WITH SUPERUSER;

\du
\dp
\dt