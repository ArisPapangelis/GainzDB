SELECT Trainee.trainee_id,Trainee.name,Trainee.surname, Trainee.sex, Trainee.coach_id
FROM GainzDB.Trainee WHERE (sex = 'Male' AND body_fat > 20) OR (sex = 'Female' AND body_fat > 30);