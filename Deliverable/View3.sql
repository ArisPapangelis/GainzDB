SELECT Trainee.trainee_id, Trainee.name, Trainee.surname  
FROM GainzDB.Coach JOIN GainzDB.Trainee ON Coach.coach_id = Trainee.coach_id
WHERE specialty = 'Yoga';