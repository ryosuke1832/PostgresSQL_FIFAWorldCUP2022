-- 03_seed_master.sql
-- Master data: Venue, NationalTeam, Coach, NationalTeam.coach_name

-- Insert Venue data
INSERT INTO Venue (venue_name, building_no, street_no, zone_no, city) VALUES
('Lusail Stadium',660,235,69,'Lusail'),
('Al Bayt Stadium',125,393,74,'Al Khor'),
('Al Thumama Stadium',521,260,46,'Doha'),
('Education City Stadium',71,2741,52,'Al Rayyan'),
('Ahmad Bin Ali Stadium',306,1700,51,'Al Rayyan'),
('Al Janoub Stadium',1707,281,91,'Al Wakrah'),
('Khalifa International Stadium',51,725,54,'Doha'),
('Stadium 974',161,210,29,'Doha');

-- Insert National Teams
INSERT INTO NationalTeam (nationality, FIFA_rank, group_name) VALUES
('Qatar', 50, 'A'),
('Ecuador', 44, 'A'),
('Senegal', 18, 'A'),
('Netherlands', 8, 'A'),
('England', 5, 'B'),
('Iran', 20, 'B'),
('USA', 16, 'B'),
('Wales', 19, 'B'),
('Argentina', 3, 'C'),
('Saudi Arabia', 51, 'C'),
('Mexico', 13, 'C'),
('Poland', 26, 'C'),
('France', 4, 'D'),
('Australia', 38, 'D'),
('Denmark', 10, 'D'),
('Tunisia', 30, 'D'),
('Spain', 7, 'E'),
('Costa Rica', 31, 'E'),
('Germany', 11, 'E'),
('Japan', 24, 'E'),
('Belgium', 2, 'F'),
('Canada', 41, 'F'),
('Morocco', 22, 'F'),
('Croatia', 12, 'F'),
('Brazil', 1, 'G'),
('Serbia', 21, 'G'),
('Switzerland', 15, 'G'),
('Cameroon', 43, 'G'),
('Portugal', 9, 'H'),
('Ghana', 61, 'H'),
('Uruguay', 14, 'H'),
('South Korea', 28, 'H');

-- Insert Coaches
INSERT INTO Coach (coach_name, team_nationality) VALUES
('Otto Addo', 'Ghana'),
('Gustavo Alfaro', 'Ecuador'),
('Diego Alonso', 'Uruguay'),
('Graham Arnold', 'Australia'),
('Paulo Bento', 'South Korea'),
('Gregg Berhalter', 'USA'),
('Aliou Cissé', 'Senegal'),
('Zlatko Dalić', 'Croatia'),
('Didier Deschamps', 'France'),
('Hansi Flick', 'Germany'),
('Louis van Gaal', 'Netherlands'),
('John Herdman', 'Canada'),
('Kasper Hjulmand', 'Denmark'),
('Jalel Kadri', 'Tunisia'),
('Luis Enrique', 'Spain'),
('Roberto Martínez', 'Belgium'),
('Gerardo Martino', 'Mexico'),
('Czesław Michniewicz', 'Poland'),
('Hajime Moriyasu', 'Japan'),
('Rob Page', 'Wales'),
('Carlos Queiroz', 'Iran'),
('Walid Regragui', 'Morocco'),
('Hervé Renard', 'Saudi Arabia'),
('Félix Sánchez', 'Qatar'),
('Fernando Santos', 'Portugal'),
('Lionel Scaloni', 'Argentina'),
('Rigobert Song', 'Cameroon'),
('Gareth Southgate', 'England'),
('Dragan Stojković', 'Serbia'),
('Luis Fernando Suárez', 'Costa Rica'),
('Tite', 'Brazil'),
('Murat Yakin', 'Switzerland');

-- Update NationalTeam's coach_name
UPDATE NationalTeam SET coach_name = 'Otto Addo' WHERE nationality = 'Ghana';
UPDATE NationalTeam SET coach_name = 'Gustavo Alfaro' WHERE nationality = 'Ecuador';
UPDATE NationalTeam SET coach_name = 'Diego Alonso' WHERE nationality = 'Uruguay';
UPDATE NationalTeam SET coach_name = 'Graham Arnold' WHERE nationality = 'Australia';
UPDATE NationalTeam SET coach_name = 'Paulo Bento' WHERE nationality = 'South Korea';
UPDATE NationalTeam SET coach_name = 'Gregg Berhalter' WHERE nationality = 'USA';
UPDATE NationalTeam SET coach_name = 'Aliou Cissé' WHERE nationality = 'Senegal';
UPDATE NationalTeam SET coach_name = 'Zlatko Dalić' WHERE nationality = 'Croatia';
UPDATE NationalTeam SET coach_name = 'Didier Deschamps' WHERE nationality = 'France';
UPDATE NationalTeam SET coach_name = 'Hansi Flick' WHERE nationality = 'Germany';
UPDATE NationalTeam SET coach_name = 'Louis van Gaal' WHERE nationality = 'Netherlands';
UPDATE NationalTeam SET coach_name = 'John Herdman' WHERE nationality = 'Canada';
UPDATE NationalTeam SET coach_name = 'Kasper Hjulmand' WHERE nationality = 'Denmark';
UPDATE NationalTeam SET coach_name = 'Jalel Kadri' WHERE nationality = 'Tunisia';
UPDATE NationalTeam SET coach_name = 'Luis Enrique' WHERE nationality = 'Spain';
UPDATE NationalTeam SET coach_name = 'Roberto Martínez' WHERE nationality = 'Belgium';
UPDATE NationalTeam SET coach_name = 'Gerardo Martino' WHERE nationality = 'Mexico';
UPDATE NationalTeam SET coach_name = 'Czesław Michniewicz' WHERE nationality = 'Poland';
UPDATE NationalTeam SET coach_name = 'Hajime Moriyasu' WHERE nationality = 'Japan';
UPDATE NationalTeam SET coach_name = 'Rob Page' WHERE nationality = 'Wales';
UPDATE NationalTeam SET coach_name = 'Carlos Queiroz' WHERE nationality = 'Iran';
UPDATE NationalTeam SET coach_name = 'Walid Regragui' WHERE nationality = 'Morocco';
UPDATE NationalTeam SET coach_name = 'Hervé Renard' WHERE nationality = 'Saudi Arabia';
UPDATE NationalTeam SET coach_name = 'Félix Sánchez' WHERE nationality = 'Qatar';
UPDATE NationalTeam SET coach_name = 'Fernando Santos' WHERE nationality = 'Portugal';
UPDATE NationalTeam SET coach_name = 'Lionel Scaloni' WHERE nationality = 'Argentina';
UPDATE NationalTeam SET coach_name = 'Rigobert Song' WHERE nationality = 'Cameroon';
UPDATE NationalTeam SET coach_name = 'Gareth Southgate' WHERE nationality = 'England';
UPDATE NationalTeam SET coach_name = 'Dragan Stojković' WHERE nationality = 'Serbia';
UPDATE NationalTeam SET coach_name = 'Luis Fernando Suárez' WHERE nationality = 'Costa Rica';
UPDATE NationalTeam SET coach_name = 'Tite' WHERE nationality = 'Brazil';
UPDATE NationalTeam SET coach_name = 'Murat Yakin' WHERE nationality = 'Switzerland';
