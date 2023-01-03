SELECT * FROM Customer WHERE state = 'RJ' OR 'DF' OR 'AB' OR 'BC' OR 'CA' OR 'WA' OR 'NY';

-- Antwoord:
SELECT * FROM Customer WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')