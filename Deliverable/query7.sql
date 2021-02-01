
DROP TABLE IF EXISTS t;
CREATE TEMPORARY TABLE t AS 
(SELECT trainee_id, OVERWEIGHT.name AS name, OVERWEIGHT.surname AS surname, OVERWEIGHT.coach_id AS coach_id, OVERWEIGHT.sex AS sex
FROM GainzDB.Coach JOIN GainzDB.OVERWEIGHT ON Coach.coach_id=OVERWEIGHT.coach_id 
WHERE OVERWEIGHT.sex = 'Female');

SELECT trainee_id, name, surname, sex
FROM t
WHERE coach_id = 3
;


