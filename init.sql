-- Drop and recreate the tables if they exist
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Groups;

-- Create the tables if they don't exist
CREATE TABLE IF NOT EXISTS Groups (
  id SERIAL PRIMARY KEY,
  group_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Students (
  id SERIAL PRIMARY KEY,
  lastname VARCHAR(255),
  firstname VARCHAR(255),
  group_id INT,
  FOREIGN KEY (group_id) REFERENCES Groups(id)
);

-- Insert data into the Groups table
INSERT INTO Groups (group_name)
VALUES
('s6_alt1'),
('s6_alt2');

-- Insert data into the Students table
INSERT INTO Students (lastname, firstname, group_id)
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
