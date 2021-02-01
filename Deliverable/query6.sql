SELECT Trainee.trainee_id, name, surname, injury_name
FROM GainzDB.Treatment JOIN GainzDB.Trainee ON Treatment.trainee_id = Trainee.trainee_id 
WHERE coach_id = 1 AND treatment_end > '2019-12-22'
;