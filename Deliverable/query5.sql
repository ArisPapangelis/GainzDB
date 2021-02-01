DROP TABLE IF EXISTS t;
CREATE TEMPORARY TABLE t AS (SELECT type, trainee_id
    FROM GainzDB.Food JOIN GainzDB.Eat ON name=food_name
    WHERE type='Vegetable');
SELECT Trainee.trainee_id
FROM GainzDB.Trainee JOIN t ON Trainee.trainee_id = t.trainee_id
WHERE goal = 'Fat loss'

;