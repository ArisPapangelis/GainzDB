SELECT DISTINCT Eat.trainee_id
FROM GainzDB.Eat JOIN GainzDB.Food ON Food.name = Eat.food_name
WHERE type NOT IN ('Poultry',  'Meat', 'Seafood', 'Dairy') 
	AND trainee_id NOT IN (SELECT DISTINCT Eat.trainee_id
	FROM GainzDB.Eat JOIN GainzDB.Food ON Food.name = Eat.food_name
	WHERE type IN ('Poultry',  'Meat', 'Seafood', 'Dairy'));
