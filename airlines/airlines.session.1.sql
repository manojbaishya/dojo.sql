SELECT ac.aircraft_code as [code],
    json_extract(ac.model, '$.en') as [model],
    ac.range as [range]
FROM aircrafts_data ac
ORDER BY range DESC;


CREATE VIEW IF NOT EXISTS aircrafts AS
    SELECT ac.aircraft_code as [code],
        json_extract(ac.model, '$.en') as [model],
        ac.range as [range]
    FROM aircrafts_data ac
    ORDER BY range DESC;


SELECT 
    ap.airport_code as [code],
    json_extract(ap.airport_name, '$.en') as [name],
    json_extract(ap.city, '$.en') as [city],
    ap.coordinates as [coordinates],
    ap.timezone as [timezone]
FROM airports_data ap
ORDER BY city DESC;


CREATE VIEW IF NOT EXISTS airports AS
    SELECT 
        ap.airport_code as [code],
        json_extract(ap.airport_name, '$.en') as [name],
        json_extract(ap.city, '$.en') as [city],
        ap.coordinates as [coordinates],
        ap.timezone as [timezone]
    FROM airports_data ap
    ORDER BY city DESC;