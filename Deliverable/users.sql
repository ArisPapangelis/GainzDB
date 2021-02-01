CREATE USER 'admin'@'localhost' IDENTIFIED BY 'iamtherealkingofthisdatabase';
CREATE USER 'admin'@'%' IDENTIFIED BY 'iamtherealkingofthisdatabase';
GRANT ALL PRIVILEGES ON GainzDB.* TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON GainzDB.* TO 'admin'@'%';

CREATE USER 'coach'@'%' IDENTIFIED BY 'iamultracoach';
GRANT SELECT, INSERT, UPDATE ON GainzDB.Coach TO 'coach'@'%';
GRANT SELECT, INSERT, UPDATE ON GainzDB.Training TO 'coach'@'%';
GRANT SELECT, INSERT, UPDATE ON GainzDB.Eat TO 'coach'@'%';
GRANT SELECT ON GainzDB.Exercise TO 'coach'@'%';
GRANT SELECT ON GainzDB.Treatment TO 'coach'@'%';
GRANT SELECT ON GainzDB.Exercise_Instance TO 'coach'@'%';
GRANT SELECT ON GainzDB.Food TO 'coach'@'%';
GRANT SELECT ON GainzDB.Trainee TO 'coach'@'%';

CREATE USER 'trainee'@'%' IDENTIFIED BY 'iwantthosegainz';
GRANT SELECT, INSERT, UPDATE ON GainzDB.Trainee TO 'trainee'@'%';
GRANT SELECT, INSERT, UPDATE ON GainzDB.Exercise_Instance TO 'trainee'@'%';
GRANT SELECT, INSERT, UPDATE ON GainzDB.Eat TO 'trainee'@'%';
GRANT SELECT ON GainzDB.Coach TO 'trainee'@'%';
GRANT SELECT ON GainzDB.Physiotherapist TO 'trainee'@'%';
GRANT SELECT ON GainzDB.Food TO 'trainee'@'%';
GRANT SELECT ON GainzDB.Training TO 'trainee'@'%';
GRANT SELECT ON GainzDB.Treatment TO 'trainee'@'%';
GRANT SELECT ON GainzDB.Injury TO 'trainee'@'%';
GRANT SELECT ON GainzDB.Exercise TO 'trainee'@'%';

CREATE USER 'physiotherapist'@'%' IDENTIFIED BY 'checkyourselfbeforeyouwreckyourself';
GRANT SELECT, INSERT, UPDATE ON GainzDB.Physiotherapist TO 'physiotherapist'@'%';
GRANT SELECT, INSERT, UPDATE ON GainzDB.Injury TO 'physiotherapist'@'%';
GRANT SELECT, INSERT, UPDATE ON GainzDB.Treatment TO 'physiotherapist'@'%';
GRANT SELECT ON GainzDB.Training TO 'physiotherapist'@'%';
GRANT SELECT ON GainzDB.Exercise TO 'physiotherapist'@'%';
GRANT SELECT ON GainzDB.Trainee TO 'physiotherapist'@'%';