-- Management PostgreSQL.Local.v17.
-- Date: 21-Feb-2025
-- Time: 12:32:12 am

select 
    table_name  
from information_schema.tables
where table_schema='public';

select * from pg_catalog.pg_database as pd ;

CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

select 
    table_name  
from information_schema.tables
where table_schema='public';

CREATE EXTENSION IF NOT EXISTS pg_stat_statements;


-- Terminate all connections to the database
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'dojo.spring'
  AND pid <> pg_backend_pid();

-- Chinook Music Store Database.
-- Date: 21-Feb-2025
-- Time: 12:32:12 am
  
select al.title, ar."name" from album as al inner join artist as ar on ar.artist_id = al.artist_id 
order by al.title ASC;

SELECT to_char(i.invoice_date, 'YYYY') AS "year",
    c.first_name || ' ' || c.last_name AS "customer",
    c.city AS "city",
    i.total AS amount,
    STRING_AGG(DISTINCT ar.name, ', ') AS "artists",
    e.first_name || ' ' || e.last_name AS "employee"
FROM Invoice AS i
    INNER JOIN customer AS c ON c.customer_id = i.customer_id
    INNER JOIN employee AS e ON e.employee_id = c.support_rep_id
    INNER JOIN invoice_line AS il ON il.invoice_id = i.invoice_id
    INNER JOIN track as tr ON tr.track_id = il.track_id
    INNER JOIN album as al ON al.album_id = tr.album_id
    INNER JOIN artist as ar ON ar.artist_id = al.artist_id
GROUP BY Year,
    customer,
    c.City,
    amount,
    employee
ORDER BY Year ASC,
    amount DESC
LIMIT 10 OFFSET 0;


-- Spring Boot Backup Database.
-- Date: 21-Feb-2025
-- Time: 12:32:12 am

 Drop the database
drop database "dojo.spring" with force;
create new database "dojo.spring" with owner 'postgres';

-- Airlines Database.
-- Date: 21-Feb-2025
-- Time: 12:32:12 am

select
    airport_code,
    airport_name,
    city,
    coordinates,
    timezone
from
    airports_data;

SELECT ac.aircraft_code as "code",
    json_extract(ac.model, '$.en') as "model",
    ac.range as "range"
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

-- F1 DB.
-- Date: 21-Feb-2025
-- Time: 12:32:12 am

select
    id,
    "name",
    first_name,
    last_name,
    full_name,
    abbreviation,
    permanent_number,
    gender,
    date_of_birth,
    date_of_death,
    place_of_birth,
    country_of_birth_country_id,
    nationality_country_id,
    second_nationality_country_id,
    best_championship_position,
    best_starting_grid_position,
    best_race_result,
    total_championship_wins,
    total_race_entries,
    total_race_starts,
    total_race_wins,
    total_race_laps,
    total_podiums,
    total_points,
    total_championship_points,
    total_pole_positions,
    total_fastest_laps,
    total_driver_of_the_day,
    total_grand_slams
from
    driver;
