SELECT coach_id, name, surname, specialty 
FROM GainzDB.Coach
WHERE specialty = 'Crossfit' OR specialty = 'TRX' AND birthdate > '1989-01-01';