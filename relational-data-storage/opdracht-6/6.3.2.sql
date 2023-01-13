SELECT 
	name,
    CASE
		WHEN name LIKE "%&agrave;%" THEN REPLACE(name, "&agrave;","à")
		WHEN name LIKE "%&aacute;%" THEN REPLACE(name, "&aacute;","á")
        WHEN name LIKE "%&egrave;%" THEN REPLACE(name, "&egrave;","è")
        WHEN name LIKE "%&eacute;%" THEN REPLACE(name, "&eacute;","é")
        WHEN name LIKE "%&aacute;%" THEN REPLACE(name, "&aacute;","á")
        WHEN name LIKE "%&ecirc%;" THEN REPLACE(name, "&ecirc;","ê")
        WHEN name LIKE "%&euml;%" THEN REPLACE(name, "&euml;","ë")
        WHEN name LIKE "%&iuml;%" THEN REPLACE(name, "&iuml;","ï")
        WHEN name LIKE "%&oacute;%" THEN REPLACE(name, "&oacute;","ó")
        WHEN name LIKE "%&ouml;%" THEN REPLACE(name, "&ouml;","ö")
        WHEN name LIKE "%&uuml;%" THEN REPLACE(name, "&uuml;","ü")
		ELSE name
    END AS nice_name
FROM mhl_suppliers
WHERE name REGEXP '&[^\s]*;' 
LIMIT 25;

-- Antwoord:
SELECT
    name,
    REPLACE (
        REPLACE (
            REPLACE (
                REPLACE (
                    REPLACE (
                        REPLACE (
                            REPLACE(name, '&eacute;', 'é'),
                            '&ouml;', 'ö'),
                        '&Uuml;', 'Ü'),
                '&euml;', 'ë'),
            '&egrave;', 'è'),
        '&iuml;','ï'),
    '&acirc;', 'â') AS nicename
FROM mhl_suppliers
WHERE name REGEXP '&[^\s]*;' LIMIT 25