/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, True, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, True, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, False, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, True, 11) 

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, False, -11),
        ('Plantmon', '2021-11-15', 2, True, -5.7),
        ('Squirtle', '1993-04-02', 3, False, -12.13),
        ('Angemon', '2005-06-12', 1, True, -45),
        ('Boarmon', '2005-06-07', 7, True, 20.4),
        ('Blossom', '1998-10-13', 3, True, 17),
        ('Ditto', '2022-05-14', 4, True, 22);

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
        ('Jennifer Orwell', 19),
        ('Bob', 45),
        ('Melody Pond', 77),
        ('Dean Winchester', 14),
        ('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES ('Pokemon'), ('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
WHERE name LIKE '%mon';

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
WHERE species_id IS NULL;

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith')
WHERE name = 'Agumon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell')
WHERE name = 'Gabumon' OR name = 'Pikachu';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob')
WHERE name = 'Devimon' OR name = 'Plantmon';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond')
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
WHERE name = 'Angemon' OR name = 'Boarmon'; 

INSERT INTO  vets (name, age, date_of_graduation) 
VALUES ('William Tatcher',45, '2000-04-23'), 
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness',38,2008-06-08);

INSERT INTO specializations (species_id, vet_id)
VALUES
((SELECT species.id FROM species WHERE species.name = 'Pokemon'),
(SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher')
),
((SELECT species.id FROM species WHERE species.name = 'Pokemon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez')
),
((SELECT species.id FROM species WHERE species.name = 'Digimon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez')
),
((SELECT species.id FROM species WHERE species.name = 'Digimon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness'));

-- VISITS 

INSERT INTO visits (date_of_visit, animal_id, vet_id)
VALUES
('2020-05-24', (SELECT animals.id FROM animals WHERE animals.name = 'Agumon'),
(SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher')
),
('2020-07-22', (SELECT animals.id FROM animals WHERE animals.name = 'Agumon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez')
),
('2021-02-02', (SELECT animals.id FROM animals WHERE animals.name = 'Gabumon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness')
),
('2020-01-05', (SELECT animals.id FROM animals WHERE animals.name = 'Pikachu'),
(SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
),
('2020-03-08', (SELECT animals.id FROM animals WHERE animals.name = 'Pikachu'),
(SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
),
('2020-05-14', (SELECT animals.id FROM animals WHERE animals.name = 'Pikachu'),
(SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
),
('2021-05-04', (SELECT animals.id FROM animals WHERE animals.name = 'Devimon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez')
),
('2021-02-24', (SELECT animals.id FROM animals WHERE animals.name = 'Charmander'),
(SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness')
),
('2019-12-21', (SELECT animals.id FROM animals WHERE animals.name = 'Plantmon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
),
('2020-08-10', (SELECT animals.id FROM animals WHERE animals.name = 'Plantmon'),
(SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher')
),
('2021-04-07', (SELECT animals.id FROM animals WHERE animals.name = 'Plantmon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
),
('2019-09-29', (SELECT animals.id FROM animals WHERE animals.name = 'Squirtle'),
(SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez')
),
('2020-10-03', (SELECT animals.id FROM animals WHERE animals.name = 'Angemon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness')
),
('2020-11-04', (SELECT animals.id FROM animals WHERE animals.name = 'Angemon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Jack Harkness')
),
('2019-01-24', (SELECT animals.id FROM animals WHERE animals.name = 'Boarmon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
),
('2019-05-15', (SELECT animals.id FROM animals WHERE animals.name = 'Boarmon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
),
('2020-02-27', (SELECT animals.id FROM animals WHERE animals.name = 'Boarmon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
),
('2020-08-03', (SELECT animals.id FROM animals WHERE animals.name = 'Boarmon'),
(SELECT vets.id FROM vets WHERE vets.name = 'Maisy Smith')
),
('2020-05-24', (SELECT animals.id FROM animals WHERE animals.name = 'Blossom'),
(SELECT vets.id FROM vets WHERE vets.name = 'Stephanie Mendez')
),
('2021-01-11', (SELECT animals.id FROM animals WHERE animals.name = 'Blossom'),
(SELECT vets.id FROM vets WHERE vets.name = 'William Tatcher')
);

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) 
SELECT * FROM (SELECT id FROM animals) animal_ids, 
(SELECT id FROM vets) vets_ids, 
generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


