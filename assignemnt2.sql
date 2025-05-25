CREATE Table rangers (
    ranger_id SERIAL PRIMARY KEY,
    name varchar(250) NOT Null, 
    region VARCHAR(250) NOT Null
);

CREATE Table species (
    species_id SERIAL PRIMARY KEY, 
    common_name varchar(250) NOT Null,
    scientific_name varchar(250) NOT Null,
    discovery_date DATE NOT NULL, 
    conservation_status varchar(250) NOT Null
);

CREATE Table sightings (
   sighting_id SERIAL PRIMARY KEY, 
   ranger_id int REFERENCES rangers(ranger_id),
   species_id int REFERENCES species(species_id),
   sighting_time TIMESTAMP not null, 
   location varchar(250) NOT Null,
   notes Text

);

INSERT into rangers (name, region)
VALUES ('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');

insert into species (common_name, scientific_name, discovery_date,conservation_status)
VALUES 
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');

INSERT into sightings (species_id, ranger_id,location, sighting_time, notes)
VALUES 
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);
-- Question 1
INSERT into rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');

-- Question 2:
select count(*) as unique_species_count from (select species_id from sightings group by species_id)  AS grouped;;

-- Question 3:
select * from sightings where LOCATION LIKE '%Pass%';

-- Question 4:
select rangers.name , count(*) as total_sightings from rangers join sightings on rangers.ranger_id=sightings.ranger_id
group by rangers.name ;


-- Question 5:
select species.common_name from species  left join sightings on species.species_id=sightings.species_id where sightings.sighting_id IS Null; 

-- Question 6:
select species.common_name, sightings.sighting_time, rangers.name from sightings 
join species on sightings.species_id=species.species_id
join rangers on sightings.ranger_id=rangers.ranger_id 
order by sightings.sighting_time desc LIMIT 2;

-- Question 7:
update species 
set conservation_status ='Historic'
where extract (year from discovery_date) < 1800; 


-- Question 8:
SELECT sighting_id ,
CASE 
when extract(HOUR from sighting_time) < 12 then 'Morning'
when extract(HOUR from sighting_time) BETWEEN 12 and 16 then 'Afternoon'
Else 'Evening'
END as time_of_day
from sightings;


-- Question 9
DELETE from rangers where
ranger_id not in (
select ranger_id from sightings);


