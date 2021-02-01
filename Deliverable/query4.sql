SELECT Trainee.trainee_id 
FROM GainzDB.Coach JOIN GainzDB.Trainee ON Coach.coach_id = Trainee.coach_id
WHERE specialty = 'Weightlifting' AND goal = 'Muscle Gain'
;