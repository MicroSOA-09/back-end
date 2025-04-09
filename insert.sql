--blog
INSERT INTO blog."BlogPosts" (
    "AuthorId", "TourId", "Title", "Description", "CreationDate", "ImageURLs", "Comments", "Ratings", "Status"
) VALUES
(1, 101, 'Prva avantura u planinama', 'Opis mog prvog putovanja u Alpe.', '2025-04-01 10:00:00+00', ARRAY['https://example.com/img1.jpg'], 
 '[{"Text": "Prelepo iskustvo!", "UserId": 2, "CreationTime": "2025-04-01T10:30:00Z", "LastUpdatedTime": "2025-04-01T10:30:00Z"}]'::jsonb,
 '[{"UserId": 2, "CreationTime": "2025-04-01T10:35:00Z", "IsPositive": true}]'::jsonb, 1),

(2, 102, 'Obilazak jezera', 'Priča o danu provedenom na jezeru.', '2025-04-02 14:00:00+00', ARRAY['https://example.com/img2.jpg', 'https://example.com/img3.jpg'], 
 '[{"Text": "Voda je bila kristalno čista!", "UserId": 3, "CreationTime": "2025-04-02T14:20:00Z", "LastUpdatedTime": "2025-04-02T14:20:00Z"}]'::jsonb,
 '[{"UserId": 3, "CreationTime": "2025-04-02T14:25:00Z", "IsPositive": true}, {"UserId": 4, "CreationTime": "2025-04-02T15:00:00Z", "IsPositive": false}]'::jsonb, 1),

(3, 103, 'Gradska tura', 'Istraživanje starog grada.', '2025-04-03 09:00:00+00', NULL, 
 '[]'::jsonb,
 '[{"UserId": 5, "CreationTime": "2025-04-03T09:15:00Z", "IsPositive": true}]'::jsonb, 0),

(4, 104, 'Pustinjska ekspedicija', 'Putovanje kroz pustinju.', '2025-04-04 12:00:00+00', ARRAY['https://example.com/img4.jpg'], 
 '[{"Text": "Vrućina je bila nepodnošljiva!", "UserId": 6, "CreationTime": "2025-04-04T12:30:00Z", "LastUpdatedTime": "2025-04-04T12:30:00Z"}]'::jsonb,
 '[]'::jsonb, 1),

(5, 105, 'Planinarenje na vrh', 'Uspon na najviši vrh.', '2025-04-05 07:00:00+00', ARRAY['https://example.com/img5.jpg'], 
 '[{"Text": "Pogled je bio neverovatan!", "UserId": 7, "CreationTime": "2025-04-05T07:45:00Z", "LastUpdatedTime": "2025-04-05T07:45:00Z"}]'::jsonb,
 '[{"UserId": 7, "CreationTime": "2025-04-05T08:00:00Z", "IsPositive": true}]'::jsonb, 1),

(1, 106, 'Druga tura u šumu', 'Šetnja kroz gustu šumu.', '2025-04-06 15:00:00+00', NULL, 
 '[]'::jsonb,
 '[{"UserId": 8, "CreationTime": "2025-04-06T15:20:00Z", "IsPositive": false}]'::jsonb, 0),

(2, 107, 'Obala mora', 'Dan na plaži.', '2025-04-07 11:00:00+00', ARRAY['https://example.com/img6.jpg'], 
 '[{"Text": "More je bilo prelepo!", "UserId": 9, "CreationTime": "2025-04-07T11:30:00Z", "LastUpdatedTime": "2025-04-07T11:30:00Z"}]'::jsonb,
 '[{"UserId": 9, "CreationTime": "2025-04-07T11:40:00Z", "IsPositive": true}]'::jsonb, 1),

(3, 108, 'Selo u brdima', 'Poseta tradicionalnom selu.', '2025-04-08 13:00:00+00', ARRAY['https://example.com/img7.jpg'], 
 '[{"Text": "Hrana je bila odlična!", "UserId": 10, "CreationTime": "2025-04-08T13:15:00Z", "LastUpdatedTime": "2025-04-08T13:15:00Z"}]'::jsonb,
 '[]'::jsonb, 1),

(4, 109, 'Noć pod zvezdama', 'Kampovanje u prirodi.', '2025-04-09 20:00:00+00', NULL, 
 '[]'::jsonb,
 '[{"UserId": 11, "CreationTime": "2025-04-09T20:30:00Z", "IsPositive": true}]'::jsonb, 0),

(5, 110, 'Reka i kanu', 'Vožnja kanuom niz reku.', '2025-04-10 08:00:00+00', ARRAY['https://example.com/img8.jpg'], 
 '[{"Text": "Avantura za pamćenje!", "UserId": 12, "CreationTime": "2025-04-10T08:45:00Z", "LastUpdatedTime": "2025-04-10T08:45:00Z"}]'::jsonb,
 '[{"UserId": 12, "CreationTime": "2025-04-10T09:00:00Z", "IsPositive": true}]'::jsonb, 1);

 --stakeholders
 INSERT INTO stakeholders."AppRatings" ("UserId", "Rating", "Description", "DateCreated") VALUES
(1, 5, 'Odlična aplikacija!', '2025-04-01 10:00:00+00'),
(2, 4, 'Dobra, ali može bolje.', '2025-04-02 12:00:00+00'),
(3, 3, NULL, '2025-04-03 14:00:00+00'),
(4, 5, 'Sve preporuke!', '2025-04-04 16:00:00+00'),
(5, 2, 'Previše bagova.', '2025-04-05 18:00:00+00'),
(6, 4, 'Solidno iskustvo.', '2025-04-06 09:00:00+00'),
(7, 5, 'Najbolja app!', '2025-04-07 11:00:00+00'),
(8, 3, 'OK, ništa posebno.', '2025-04-08 13:00:00+00'),
(9, 4, 'Dobra funkcionalnost.', '2025-04-09 15:00:00+00'),
(10, 5, 'Fantastično!', '2025-04-10 17:00:00+00');

INSERT INTO stakeholders."Clubs" ("Name", "Description", "Image", "OwnerId") VALUES
('Planinari Srbije', 'Klub za ljubitelje planina.', 'https://example.com/club1.jpg', 1),
('Biciklisti Beograda', 'Grupa za biciklističke ture.', 'https://example.com/club2.jpg', 2),
('Avanturisti Novog Sada', 'Istraživanje prirode.', 'https://example.com/club3.jpg', 3),
('Trkači Zlatibora', 'Klub za trčanje.', 'https://example.com/club4.jpg', 4),
('Kamp Srbija', 'Kampovanje u prirodi.', 'https://example.com/club5.jpg', 5),
('Pecaroši Dunava', 'Ribolovci na Dunavu.', 'https://example.com/club6.jpg', 6),
('Fotografi Prirode', 'Fotografisanje pejzaža.', 'https://example.com/club7.jpg', 7),
('Planinski Vodiči', 'Vodiči za uspone.', 'https://example.com/club8.jpg', 8),
('Eko Aktivisti', 'Zaštita prirode.', 'https://example.com/club9.jpg', 9),
('Adrenalin Klub', 'Ekstremni sportovi.', 'https://example.com/club10.jpg', 10);

INSERT INTO stakeholders."FollowerMessages" ("UserId", "FollowerId", "FollowerUsername", "Message", "IsRead") VALUES
(1, 2, 'marko123', 'Ćao, kako si?', false),
(2, 3, 'jovana89', 'Idemo na turu?', true),
(3, 4, 'petar77', 'Gde si bio juče?', false),
(4, 5, 'ana456', 'Super slika!', true),
(5, 6, 'nikola22', 'Kada je sledeći događaj?', false),
(6, 7, 'maja11', 'Hvala na savetu!', true),
(7, 8, 'stefan99', 'Kako je prošla tura?', false),
(8, 9, 'lena33', 'Vidimo se sutra!', true),
(9, 10, 'ivan88', 'Gde si snimio ovo?', false),
(10, 1, 'katarina44', 'Čestitam na uspehu!', true);

INSERT INTO stakeholders."Followers" ("UserId", "FollowerId", "FollowerUsername") VALUES
(1, 2, 'marko123'),
(2, 3, 'jovana89'),
(3, 4, 'petar77'),
(4, 5, 'ana456'),
(5, 6, 'nikola22'),
(6, 7, 'maja11'),
(7, 8, 'stefan99'),
(8, 9, 'lena33'),
(9, 10, 'ivan88'),
(10, 1, 'katarina44');

INSERT INTO stakeholders."RequestResponseNotifications" ("AuthorId", "Comment", "Creation") VALUES
(1, 'Zahtev odobren.', '2025-04-01 08:00:00+00'),
(2, 'Potrebne dodatne informacije.', '2025-04-02 09:00:00+00'),
(3, 'Odbijen zahtev.', '2025-04-03 10:00:00+00'),
(4, 'Uspešno obrađeno.', '2025-04-04 11:00:00+00'),
(5, 'Čeka na odobrenje.', '2025-04-05 12:00:00+00'),
(6, 'Prihvaćeno!', '2025-04-06 13:00:00+00'),
(7, 'Odbijeno zbog greške.', '2025-04-07 14:00:00+00'),
(8, 'Uspešno završeno.', '2025-04-08 15:00:00+00'),
(9, 'Još u obradi.', '2025-04-09 16:00:00+00'),
(10, 'Odobreno sa komentarom.', '2025-04-10 17:00:00+00');

INSERT INTO stakeholders."TouristXP" ("Experience", "Level", "TouristId") VALUES
(100, 1, 1),
(250, 2, 2),
(500, 3, 3),
(750, 4, 4),
(1000, 5, 5),
(150, 1, 6),
(300, 2, 7),
(600, 3, 8),
(900, 4, 9),
(1200, 5, 10);

INSERT INTO stakeholders."TourObjectRequests" ("AuthorId", "TourObjectId", "Status") VALUES
(1, 101, 1),
(2, 102, 0),
(3, 103, 2),
(4, 104, 1),
(5, 105, 0),
(6, 106, 2),
(7, 107, 1),
(8, 108, 0),
(9, 109, 2),
(10, 110, 1);

INSERT INTO stakeholders."TourPointRequests" ("AuthorId", "TourPointId", "Status") VALUES
(1, 201, 1),
(2, 202, 0),
(3, 203, 2),
(4, 204, 1),
(5, 205, 0),
(6, 206, 2),
(7, 207, 1),
(8, 208, 0),
(9, 209, 2),
(10, 210, 1);

INSERT INTO stakeholders."UserMileages" ("UserId", "Mileage", "MileageByMonth") VALUES
(1, 150.5, 50.2),
(2, 200.0, 75.0),
(3, 300.7, 100.3),
(4, 450.2, 150.1),
(5, 600.0, 200.0),
(6, 120.8, 40.3),
(7, 250.5, 83.5),
(8, 350.0, 116.7),
(9, 500.9, 166.9),
(10, 700.4, 233.5);

INSERT INTO stakeholders."UserPositions" ("UserId", "Latitude", "Longitude") VALUES
(1, 44.7866, 20.4489),
(2, 45.2671, 19.8335),
(3, 43.3209, 21.8954),
(4, 44.0165, 20.9114),
(5, 42.9981, 21.9465),
(6, 44.8206, 20.4622),
(7, 45.2517, 19.8369),
(8, 43.8914, 20.3483),
(9, 44.6544, 20.2002),
(10, 43.1531, 22.5863);

INSERT INTO stakeholders."Users" ("Username", "Password", "Role", "IsActive", "VerificationToken") VALUES
('marko123', 'hashedpass1', 1, true, 'token1'),
('jovana89', 'hashedpass2', 2, true, 'token2'),
('petar77', 'hashedpass3', 1, false, 'token3'),
('ana456', 'hashedpass4', 3, true, 'token4'),
('nikola22', 'hashedpass5', 2, true, 'token5'),
('maja11', 'hashedpass6', 1, false, 'token6'),
('stefan99', 'hashedpass7', 3, true, 'token7'),
('lena33', 'hashedpass8', 2, true, 'token8'),
('ivan88', 'hashedpass9', 1, false, 'token9'),
('katarina44', 'hashedpass10', 3, true, 'token10');

INSERT INTO stakeholders."UserTourMileages" ("UserId", "TourMileage", "Time") VALUES
(1, 25.5, '2025-04-01 08:00:00+00'),
(2, 30.0, '2025-04-02 09:00:00+00'),
(3, 45.7, '2025-04-03 10:00:00+00'),
(4, 60.2, '2025-04-04 11:00:00+00'),
(5, 75.0, '2025-04-05 12:00:00+00'),
(6, 20.8, '2025-04-06 13:00:00+00'),
(7, 35.5, '2025-04-07 14:00:00+00'),
(8, 50.0, '2025-04-08 15:00:00+00'),
(9, 65.9, '2025-04-09 16:00:00+00'),
(10, 80.4, '2025-04-10 17:00:00+00');

INSERT INTO stakeholders."PasswordResets" ("UserId", "Token", "ExpiryTime") VALUES
(1, 'reset1', '2025-04-01 12:00:00+00'),
(2, 'reset2', '2025-04-02 13:00:00+00'),
(3, 'reset3', '2025-04-03 14:00:00+00'),
(4, 'reset4', '2025-04-04 15:00:00+00'),
(5, 'reset5', '2025-04-05 16:00:00+00'),
(6, 'reset6', '2025-04-06 17:00:00+00'),
(7, 'reset7', '2025-04-07 18:00:00+00'),
(8, 'reset8', '2025-04-08 19:00:00+00'),
(9, 'reset9', '2025-04-09 20:00:00+00'),
(10, 'reset10', '2025-04-10 21:00:00+00');

INSERT INTO stakeholders."People" ("UserId", "Name", "Surname", "Email", "ProfileImage", "Bio", "Quote") VALUES
(1, 'Marko', 'Petrović', 'marko@example.com', 'https://example.com/img1.jpg', 'Ljubitelj prirode.', 'Živi punim plućima.'),
(2, 'Jovana', 'Marković', 'jovana@example.com', NULL, 'Avanturista.', NULL),
(3, 'Petar', 'Jovanović', 'petar@example.com', 'https://example.com/img3.jpg', NULL, 'Sve je moguće.'),
(4, 'Ana', 'Nikolić', 'ana@example.com', 'https://example.com/img4.jpg', 'Fotograf.', 'Slikaj trenutak.'),
(5, 'Nikola', 'Stojanović', 'nikola@example.com', NULL, 'Planinar.', NULL),
(6, 'Maja', 'Ilić', 'maja@example.com', 'https://example.com/img6.jpg', 'Trkač.', 'Trči ka cilju.'),
(7, 'Stefan', 'Đorđević', 'stefan@example.com', NULL, NULL, 'Budi promena.'),
(8, 'Lena', 'Pavlović', 'lena@example.com', 'https://example.com/img8.jpg', 'Eko aktivista.', NULL),
(9, 'Ivan', 'Ristić', 'ivan@example.com', NULL, 'Biciklista.', 'Pedaliraj dalje.'),
(10, 'Katarina', 'Milošević', 'katarina@example.com', 'https://example.com/img10.jpg', 'Kampovanje.', 'Priroda je dom.');


--tours

-- SQL skripta za šemu "tours" sa 10 unosa po tabeli

-- 1. tours."Competitions"
INSERT INTO tours."Competitions" ("TourId", "StartDate", "Duration", "Status") VALUES
(1, '2025-04-01 08:00:00+00', 3, 1),
(2, '2025-04-02 09:00:00+00', 5, 0),
(3, '2025-04-03 10:00:00+00', 2, 2),
(4, '2025-04-04 11:00:00+00', 4, 1),
(5, '2025-04-05 12:00:00+00', 6, 0),
(6, '2025-04-06 13:00:00+00', 3, 2),
(7, '2025-04-07 14:00:00+00', 5, 1),
(8, '2025-04-08 15:00:00+00', 2, 0),
(9, '2025-04-09 16:00:00+00', 4, 2),
(10, '2025-04-10 17:00:00+00', 6, 1);

-- 2. tours."Equipment"
INSERT INTO tours."Equipment" ("Name", "Description") VALUES
('Šator', 'Lagan šator za kampovanje.'),
('Planinarske cipele', 'Udobre i vodootporne.'),
('Štapovi za hodanje', 'Podesivi štapovi.'),
('Ruksak', 'Kapacitet 50L.'),
('Lampa', 'LED lampa sa baterijom.'),
('Kompas', 'Precizan i lagan.'),
('Boca za vodu', '1L, termoizolovana.'),
('Nož', 'Višenamenski džepni nož.'),
('Uže', '10m, izdržljivo.'),
('Prva pomoć', 'Osnovni set za hitne slučajeve.');

-- 3. tours."GuideReviews"
INSERT INTO tours."GuideReviews" ("UserId", "GuideId", "Rating", "Comment", "SubmissionDate") VALUES
(1, 1, 5, 'Odličan vodič!', '2025-04-01 10:00:00+00'),
(2, 2, 4, 'Vrlo dobar, ali malo brz.', '2025-04-02 11:00:00+00'),
(3, 3, 3, NULL, '2025-04-03 12:00:00+00'),
(4, 4, 5, 'Super iskustvo!', '2025-04-04 13:00:00+00'),
(5, 5, 2, 'Nije bio strpljiv.', '2025-04-05 14:00:00+00'),
(6, 6, 4, 'Zabavan i poučan.', '2025-04-06 15:00:00+00'),
(7, 7, 5, 'Najbolji vodič!', '2025-04-07 16:00:00+00'),
(8, 8, 3, 'Solidno.', '2025-04-08 17:00:00+00'),
(9, 9, 4, 'Dobra organizacija.', '2025-04-09 18:00:00+00'),
(10, 10, 5, 'Preporučujem!', '2025-04-10 19:00:00+00');

-- 4. tours."ObjInTours"
INSERT INTO tours."ObjInTours" ("IdObject", "IdTour") VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5),
(106, 6),
(107, 7),
(108, 8),
(109, 9),
(110, 10);

-- 5. tours."Preferences"
INSERT INTO tours."Preferences" ("UserId", "PreferredDifficulty", "TransportationPreferences", "InterestTags") VALUES
(1, 2, ARRAY[1, 2], ARRAY['priroda', 'planinarenje']),
(2, 3, ARRAY[2, 3], ARRAY['avantura', 'biciklizam']),
(3, 1, ARRAY[1], ARRAY['kultura', 'istorija']),
(4, 4, ARRAY[3, 4], ARRAY['ekstremni sportovi']),
(5, 2, ARRAY[2], ARRAY['kampovanje']),
(6, 3, ARRAY[1, 3], ARRAY['fotografija', 'priroda']),
(7, 1, ARRAY[1, 2], ARRAY['oporavak']),
(8, 4, ARRAY[4], ARRAY['adrenalin']),
(9, 2, ARRAY[2, 3], ARRAY['jezera', 'planine']),
(10, 3, ARRAY[1, 4], ARRAY['pešačenje', 'kultura']);

-- 6. tours."Problems"
INSERT INTO tours."Problems" ("Category", "Priority", "Description", "Time", "IdTourist", "IdGuide", "IsSolved", "Deadline", "IdTour") VALUES
('Logistika', 'Visoka', 'Kasni prevoz.', '2025-04-01 08:00:00+00', 1, 1, false, '2025-04-02 08:00:00+00', 1),
('Oprema', 'Srednja', 'Pokvaren šator.', '2025-04-02 09:00:00+00', 2, 2, true, '2025-04-03 09:00:00+00', 2),
('Vreme', 'Niska', 'Kiša otežava turu.', '2025-04-03 10:00:00+00', 3, 3, false, '2025-04-04 10:00:00+00', 3),
('Hrana', 'Visoka', 'Nedostatak vode.', '2025-04-04 11:00:00+00', 4, 4, false, '2025-04-05 11:00:00+00', 4),
('Sigurnost', 'Visoka', 'Povređen učesnik.', '2025-04-05 12:00:00+00', 5, 5, true, '2025-04-06 12:00:00+00', 5),
('Navigacija', 'Srednja', 'Pogrešan put.', '2025-04-06 13:00:00+00', 6, 6, false, '2025-04-07 13:00:00+00', 6),
('Oprema', 'Niska', 'Izgubljen kompas.', '2025-04-07 14:00:00+00', 7, 7, true, '2025-04-08 14:00:00+00', 7),
('Komunikacija', 'Srednja', 'Nema signala.', '2025-04-08 15:00:00+00', 8, 8, false, '2025-04-09 15:00:00+00', 8),
('Vreme', 'Visoka', 'Olujno nevreme.', '2025-04-09 16:00:00+00', 9, 9, false, '2025-04-10 16:00:00+00', 9),
('Logistika', 'Niska', 'Kašnjenje starta.', '2025-04-10 17:00:00+00', 10, 10, true, '2025-04-11 17:00:00+00', 10);

-- 7. tours."PublicTourPoint"
INSERT INTO tours."PublicTourPoint" ("IdTour", "Name", "Description", "Latitude", "Longitude", "ImageUrl") VALUES
(1, 'Vrh planine', 'Pogled na dolinu.', 44.7866, 20.4489, 'https://example.com/pt1.jpg'),
(2, 'Jezero', 'Mirna voda.', 45.2671, 19.8335, 'https://example.com/pt2.jpg'),
(3, 'Stari grad', 'Istorijski centar.', 43.3209, 21.8954, 'https://example.com/pt3.jpg'),
(4, 'Šuma', 'Gusta vegetacija.', 44.0165, 20.9114, 'https://example.com/pt4.jpg'),
(5, 'Pećina', 'Prirodna formacija.', 42.9981, 21.9465, 'https://example.com/pt5.jpg'),
(6, 'Reka', 'Brza struja.', 44.8206, 20.4622, 'https://example.com/pt6.jpg'),
(7, 'Brdo', 'Lagan uspon.', 45.2517, 19.8369, 'https://example.com/pt7.jpg'),
(8, 'Vodopad', 'Scenski prizor.', 43.8914, 20.3483, 'https://example.com/pt8.jpg'),
(9, 'Poljana', 'Otvoren prostor.', 44.6544, 20.2002, 'https://example.com/pt9.jpg'),
(10, 'Most', 'Stari kameni most.', 43.1531, 22.5863, 'https://example.com/pt10.jpg');

-- 8. tours."TourBundles"
INSERT INTO tours."TourBundles" ("Name", "Price", "TourIds", "Status") VALUES
('Planinski paket', 150.0, ARRAY[1, 2], 1),
('Jezero i šuma', 200.0, ARRAY[3, 4], 0),
('Istorijska tura', 100.0, ARRAY[5], 2),
('Avantura', 300.0, ARRAY[6, 7], 1),
('Priroda', 250.0, ARRAY[8, 9], 0),
('Reka i brdo', 180.0, ARRAY[10], 2),
('Eko tura', 220.0, ARRAY[1, 3], 1),
('Adrenalin', 350.0, ARRAY[2, 4], 0),
('Kombinacija', 280.0, ARRAY[5, 6], 2),
('Komplet', 400.0, ARRAY[7, 8, 9], 1);

-- 9. tours."TourEquipments"
INSERT INTO tours."TourEquipments" ("TourId", "EquipmentId", "IsSelected") VALUES
(1, 1, true),
(2, 2, false),
(3, 3, true),
(4, 4, false),
(5, 5, true),
(6, 6, false),
(7, 7, true),
(8, 8, false),
(9, 9, true),
(10, 10, false);

-- 10. tours."TourExecutions"
INSERT INTO tours."TourExecutions" ("UserId", "TourId", "Status") VALUES
(1, 1, 1),
(2, 2, 0),
(3, 3, 2),
(4, 4, 1),
(5, 5, 0),
(6, 6, 2),
(7, 7, 1),
(8, 8, 0),
(9, 9, 2),
(10, 10, 1);

-- 11. tours."TouristEquipment"
INSERT INTO tours."TouristEquipment" ("TouristId", "Equipment") VALUES
(1, ARRAY[1, 2]),
(2, ARRAY[3]),
(3, ARRAY[4, 5]),
(4, ARRAY[6]),
(5, ARRAY[7, 8]),
(6, ARRAY[9]),
(7, ARRAY[10, 1]),
(8, ARRAY[2, 3]),
(9, ARRAY[4]),
(10, ARRAY[5, 6]);

-- 12. tours."TourObject"
INSERT INTO tours."TourObject" ("Name", "Description", "ImageUrl", "Category", "Latitude", "Longitude") VALUES
('Planina Tara', 'Prelepe staze.', 'https://example.com/to1.jpg', 1, 43.8914, 19.8369),
('Jezero Perućac', 'Mirna voda.', 'https://example.com/to2.jpg', 2, 44.0165, 19.8335),
('Stari Ras', 'Istorijski lokalitet.', 'https://example.com/to3.jpg', 3, 43.3209, 20.9114),
('Šuma Fruška Gora', 'Bogata flora.', 'https://example.com/to4.jpg', 1, 45.2517, 19.8954),
('Pećina Resava', 'Stalaktiti.', 'https://example.com/to5.jpg', 4, 44.6544, 21.9465),
('Reka Drina', 'Brzaci.', 'https://example.com/to6.jpg', 2, 44.8206, 19.4622),
('Zlatibor', 'Planinski vrhovi.', 'https://example.com/to7.jpg', 1, 43.7266, 19.6989),
('Vodopad Sopotnica', 'Prirodna lepota.', 'https://example.com/to8.jpg', 2, 43.8914, 20.3483),
('Kopaonik', 'Ski staze.', 'https://example.com/to9.jpg', 1, 43.2691, 20.8222),
('Đerdap', 'Klisura Dunava.', 'https://example.com/to10.jpg', 3, 44.6544, 22.5863);

-- 13. tours."Tours"
INSERT INTO tours."Tours" ("Name", "DifficultyLevel", "Description", "Tags", "Status", "Price", "UserId", "PublishedDateTime", "ArchivedDateTime", "TourCharacteristics") VALUES
('Uspon na Taru', 3, 'Izazovna tura.', ARRAY['planinarenje', 'priroda'], 1, 100, 1, '2025-04-01 08:00:00+00', NULL, '[{"Distance": 15.5, "Duration": 5}]'::jsonb),
('Jezero Perućac', 1, 'Lagana šetnja.', ARRAY['jezero', 'oporavak'], 0, 50, 2, NULL, NULL, '[{"Distance": 5.0, "Duration": 2}]'::jsonb),
('Stari Ras', 2, 'Istorijska tura.', ARRAY['kultura', 'istorija'], 2, 80, 3, '2025-04-03 10:00:00+00', '2025-04-04 10:00:00+00', '[{"Distance": 8.0, "Duration": 3}]'::jsonb),
('Fruška Gora', 3, 'Šumska avantura.', ARRAY['šuma', 'pešačenje'], 1, 120, 4, '2025-04-04 11:00:00+00', NULL, '[{"Distance": 20.0, "Duration": 6}]'::jsonb),
('Pećina Resava', 2, 'Podzemna tura.', ARRAY['pećina', 'priroda'], 0, 90, 5, NULL, NULL, '[{"Distance": 10.0, "Duration": 4}]'::jsonb),
('Drinska avantura', 4, 'Brzaci Drine.', ARRAY['reka', 'adrenalin'], 2, 150, 6, '2025-04-06 13:00:00+00', '2025-04-07 13:00:00+00', '[{"Distance": 25.0, "Duration": 7}]'::jsonb),
('Zlatiborska staza', 2, 'Planinska tura.', ARRAY['planine', 'oporavak'], 1, 110, 7, '2025-04-07 14:00:00+00', NULL, '[{"Distance": 12.0, "Duration": 4}]'::jsonb),
('Sopotnica', 1, 'Vodopad i priroda.', ARRAY['vodopad', 'priroda'], 0, 60, 8, NULL, NULL, '[{"Distance": 6.0, "Duration": 2}]'::jsonb),
('Kopaonik', 3, 'Ski i pešačenje.', ARRAY['planine', 'sport'], 2, 130, 9, '2025-04-09 16:00:00+00', '2025-04-10 16:00:00+00', '[{"Distance": 18.0, "Duration": 5}]'::jsonb),
('Đerdapska klisura', 2, 'Dunavska tura.', ARRAY['reka', 'kultura'], 1, 100, 10, '2025-04-10 17:00:00+00', NULL, '[{"Distance": 15.0, "Duration": 4}]'::jsonb);

-- 14. tours."CompetitionApplies"
INSERT INTO tours."CompetitionApplies" ("CompetitionId", "ImageUrl", "UserId", "NumLikes") VALUES
(1, 'https://example.com/ca1.jpg', 1, 25),
(2, 'https://example.com/ca2.jpg', 2, 15),
(3, 'https://example.com/ca3.jpg', 3, 30),
(4, 'https://example.com/ca4.jpg', 4, 10),
(5, 'https://example.com/ca5.jpg', 5, 20),
(6, 'https://example.com/ca6.jpg', 6, 35),
(7, 'https://example.com/ca7.jpg', 7, 5),
(8, 'https://example.com/ca8.jpg', 8, 40),
(9, 'https://example.com/ca9.jpg', 9, 12),
(10, 'https://example.com/ca10.jpg', 10, 28);

-- 15. tours."ProblemMessages"
INSERT INTO tours."ProblemMessages" ("Content", "IsRead", "ProblemId", "IdSender") VALUES
('Prevoz kasni 2h.', false, 1, 1),
('Šator je popravljen.', true, 2, 2),
('Kiša se nastavlja.', false, 3, 3),
('Donesite vodu hitno.', false, 4, 4),
('Povreda je sanirana.', true, 5, 5),
('Sklonili smo se.', false, 6, 6),
('Kompas pronađen.', true, 7, 7),
('Pokušavam zvati.', false, 8, 8),
('Olujna najava.', false, 9, 9),
('Start pomeren.', true, 10, 10);

-- 16. tours."TourExecutionPositions"
INSERT INTO tours."TourExecutionPositions" ("TourExecutionId", "LastActivity", "Latitude", "Longitude") VALUES
(1, '2025-04-01 09:00:00+00', 44.7866, 20.4489),
(2, NULL, 45.2671, 19.8335),
(3, '2025-04-03 11:00:00+00', 43.3209, 21.8954),
(4, '2025-04-04 12:00:00+00', 44.0165, 20.9114),
(5, NULL, 42.9981, 21.9465),
(6, '2025-04-06 14:00:00+00', 44.8206, 20.4622),
(7, '2025-04-07 15:00:00+00', 45.2517, 19.8369),
(8, NULL, 43.8914, 20.3483),
(9, '2025-04-09 17:00:00+00', 44.6544, 20.2002),
(10, '2025-04-10 18:00:00+00', 43.1531, 22.5863);

-- 17. tours."TourPointExecutions"
INSERT INTO tours."TourPointExecutions" ("TourExecutionId", "TourPointId", "CompletionTime", "Completed", "Secret") VALUES
(1, 1, '2025-04-01 10:00:00+00', true, 'secret1'),
(2, 2, NULL, false, 'secret2'),
(3, 3, '2025-04-03 12:00:00+00', true, 'secret3'),
(4, 4, '2025-04-04 13:00:00+00', true, 'secret4'),
(5, 5, NULL, false, 'secret5'),
(6, 6, '2025-04-06 15:00:00+00', true, 'secret6'),
(7, 7, '2025-04-07 16:00:00+00', true, 'secret7'),
(8, 8, NULL, false, 'secret8'),
(9, 9, '2025-04-09 18:00:00+00', true, 'secret9'),
(10, 10, '2025-04-10 19:00:00+00', true, 'secret10');

-- 18. tours."TourPoint"
INSERT INTO tours."TourPoint" ("TourId", "Name", "Description", "Latitude", "Longitude", "ImageUrl", "Secret") VALUES
(1, 'Vrh Tare', 'Pogled na Drinu.', 43.8914, 19.8369, 'https://example.com/tp1.jpg', 'secret1'),
(2, 'Obala jezera', 'Miran kraj.', 44.0165, 19.8335, 'https://example.com/tp2.jpg', 'secret2'),
(3, 'Kapija Rasa', 'Ulaz u grad.', 43.3209, 20.9114, 'https://example.com/tp3.jpg', 'secret3'),
(4, 'Šumska čistina', 'Odmorište.', 45.2517, 19.8954, 'https://example.com/tp4.jpg', 'secret4'),
(5, 'Ulaz u pećinu', 'Mračan prolaz.', 44.6544, 21.9465, 'https://example.com/tp5.jpg', 'secret5'),
(6, 'Brzaci Drine', 'Adrenalin.', 44.8206, 19.4622, 'https://example.com/tp6.jpg', 'secret6'),
(7, 'Zlatiborska visoravan', 'Prostranstvo.', 43.7266, 19.6989, 'https://example.com/tp7.jpg', 'secret7'),
(8, 'Baza vodopada', 'Osveženje.', 43.8914, 20.3483, 'https://example.com/tp8.jpg', 'secret8'),
(9, 'Kopaonička staza', 'Ski put.', 43.2691, 20.8222, 'https://example.com/tp9.jpg', 'secret9'),
(10, 'Đerdapski vidikovac', 'Pogled na Dunav.', 44.6544, 22.5863, 'https://example.com/tp10.jpg', 'secret10');

-- 19. tours."TourReviews"
INSERT INTO tours."TourReviews" ("Grade", "Comment", "TouristId", "AttendanceDate", "ReviewDate", "Images", "TourId") VALUES
(4.5, 'Prelepa tura!', 1, '2025-04-01 08:00:00+00', '2025-04-02 08:00:00+00', ARRAY['https://example.com/tr1.jpg'], 1),
(3.0, 'Moglo je bolje.', 2, '2025-04-02 09:00:00+00', '2025-04-03 09:00:00+00', ARRAY['https://example.com/tr2.jpg'], 2),
(5.0, 'Fantastično!', 3, '2025-04-03 10:00:00+00', '2025-04-04 10:00:00+00', ARRAY['https://example.com/tr3.jpg', 'https://example.com/tr4.jpg'], 3),
(4.0, 'Dobra organizacija.', 4, '2025-04-04 11:00:00+00', '2025-04-05 11:00:00+00', ARRAY['https://example.com/tr5.jpg'], 4),
(2.5, 'Previše teško.', 5, '2025-04-05 12:00:00+00', '2025-04-06 12:00:00+00', ARRAY['https://example.com/tr6.jpg'], 5),
(4.8, 'Adrenalin na max!', 6, '2025-04-06 13:00:00+00', '2025-04-07 13:00:00+00', ARRAY['https://example.com/tr7.jpg'], 6),
(3.5, 'Solidna tura.', 7, '2025-04-07 14:00:00+00', '2025-04-08 14:00:00+00', ARRAY['https://example.com/tr8.jpg'], 7),
(4.2, 'Prelep vodopad.', 8, '2025-04-08 15:00:00+00', '2025-04-09 15:00:00+00', ARRAY['https://example.com/tr9.jpg'], 8),
(5.0, 'Najbolja tura!', 9, '2025-04-09 16:00:00+00', '2025-04-10 16:00:00+00', ARRAY['https://example.com/tr10.jpg'], 9),
(4.0, 'Dunav je predivan.', 10, '2025-04-10 17:00:00+00', '2025-04-11 17:00:00+00', ARRAY['https://example.com/tr11.jpg'], 10);

-- Encounters

-- SQL skripta za šemu "encounters" sa 10 unosa po tabeli

-- 1. encounters."EncounterExecutions"
INSERT INTO encounters."EncounterExecutions" ("UserId", "EncounterId", "CompletionTime", "IsCompleted") VALUES
(1, 1, '2025-04-01 10:00:00+00', true),
(2, 2, NULL, false),
(3, 3, '2025-04-03 12:00:00+00', true),
(4, 4, '2025-04-04 14:00:00+00', true),
(5, 5, NULL, false),
(6, 6, '2025-04-06 16:00:00+00', true),
(7, 7, '2025-04-07 18:00:00+00', true),
(8, 8, NULL, false),
(9, 9, '2025-04-09 20:00:00+00', true),
(10, 10, '2025-04-10 22:00:00+00', true);

-- 2. encounters."Encounters"
INSERT INTO encounters."Encounters" ("Name", "Description", "XpPoints", "Status", "Type", "Latitude", "Longitude", "ShouldBeApproved") VALUES
('Skriveni vodopad', 'Pronađi tajni vodopad.', 50, 1, 0, 44.7866, 20.4489, false),
('Društveni izazov', 'Okupi grupu turista.', 75, 0, 1, 45.2671, 19.8335, true),
('Istorijski trag', 'Otkrij stari spomenik.', 30, 2, 0, 43.3209, 21.8954, false),
('Planinski vrh', 'Popni se na vrh.', 100, 1, 2, 44.0165, 20.9114, true),
('Reka i most', 'Pređi stari most.', 40, 0, 0, 42.9981, 21.9465, false),
('Šumska staza', 'Prođi kroz šumu.', 60, 2, 1, 44.8206, 20.4622, true),
('Pećinski izazov', 'Istraži pećinu.', 80, 1, 0, 45.2517, 19.8369, false),
('Gradski trg', 'Pronađi trg.', 25, 0, 2, 43.8914, 20.3483, true),
('Jezero u magli', 'Stigni do jezera.', 45, 2, 0, 44.6544, 20.2002, false),
('Klisura', 'Prođi klisuru.', 90, 1, 1, 43.1531, 22.5863, true);

-- 3. encounters."HiddenLocationEncounters"
INSERT INTO encounters."HiddenLocationEncounters" ("ImageURL", "ImageLatitude", "ImageLongitude", "DistanceTreshold", "EncounterId") VALUES
('https://example.com/hl1.jpg', 44.7860, 20.4490, 0.5, 1),
('https://example.com/hl2.jpg', 45.2665, 19.8340, 1.0, 2),
('https://example.com/hl3.jpg', 43.3210, 21.8960, 0.3, 3),
('https://example.com/hl4.jpg', 44.0170, 20.9120, 0.8, 4),
('https://example.com/hl5.jpg', 42.9985, 21.9470, 0.4, 5),
('https://example.com/hl6.jpg', 44.8210, 20.4630, 0.6, 6),
('https://example.com/hl7.jpg', 45.2520, 19.8370, 0.7, 7),
('https://example.com/hl8.jpg', 43.8920, 20.3490, 0.2, 8),
('https://example.com/hl9.jpg', 44.6550, 20.2010, 0.9, 9),
('https://example.com/hl10.jpg', 43.1535, 22.5870, 0.5, 10);

-- 4. encounters."SocialEncounters"
INSERT INTO encounters."SocialEncounters" ("EncounterId", "TouristsRequiredForCompletion", "DistanceTreshold", "TouristIDs") VALUES
(1, 3, 0.5, ARRAY[1, 2, 3]),
(2, 5, 1.0, ARRAY[2, 4, 6, 8, 10]),
(3, 2, 0.3, ARRAY[3, 5]),
(4, 4, 0.8, ARRAY[1, 4, 7, 9]),
(5, 3, 0.4, ARRAY[2, 5, 8]),
(6, 6, 0.6, ARRAY[1, 3, 5, 7, 9, 10]),
(7, 2, 0.7, ARRAY[4, 6]),
(8, 4, 0.2, ARRAY[2, 3, 8, 10]),
(9, 3, 0.9, ARRAY[1, 5, 7]),
(10, 5, 0.5, ARRAY[3, 4, 6, 8, 9]);

-- 5. encounters."TourKeyPointEncounters"
INSERT INTO encounters."TourKeyPointEncounters" ("EncounterId", "KeyPointId", "IsMandatory") VALUES
(1, 101, true),
(2, 102, false),
(3, 103, true),
(4, 104, false),
(5, 105, true),
(6, 106, false),
(7, 107, true),
(8, 108, false),
(9, 109, true),
(10, 110, false);

-- Payments

-- SQL skripta za šemu "payments" sa 10 unosa po tabeli

-- 1. payments."BundlePayRecords"
INSERT INTO payments."BundlePayRecords" ("TouristId", "TourBundleId", "Price", "DateCreated") VALUES
(1, 101, 150.0, '2025-04-01 08:00:00+00'),
(2, 102, 200.0, '2025-04-02 09:00:00+00'),
(3, 103, 100.0, '2025-04-03 10:00:00+00'),
(4, 104, 300.0, '2025-04-04 11:00:00+00'),
(5, 105, 250.0, '2025-04-05 12:00:00+00'),
(6, 106, 180.0, '2025-04-06 13:00:00+00'),
(7, 107, 220.0, '2025-04-07 14:00:00+00'),
(8, 108, 350.0, '2025-04-08 15:00:00+00'),
(9, 109, 280.0, '2025-04-09 16:00:00+00'),
(10, 110, 400.0, '2025-04-10 17:00:00+00');

-- 2. payments."Coupons"
INSERT INTO payments."Coupons" ("Code", "Discount", "ExpirationDate", "TourId", "TouristId", "AuthorId") VALUES
('SAVE10', 10, '2025-05-01 23:59:59+00', 1, 1, 101),
('DISCOUNT20', 20, '2025-05-02 23:59:59+00', 2, 2, 102),
('TOURFREE', 15, '2025-05-03 23:59:59+00', 3, 3, 103),
('PLANINA25', 25, '2025-05-04 23:59:59+00', 4, 4, 104),
('SUMMER10', 10, '2025-05-05 23:59:59+00', 5, 5, 105),
('RIVER15', 15, '2025-05-06 23:59:59+00', 6, 6, 106),
('ECO20', 20, '2025-05-07 23:59:59+00', 7, 7, 107),
('ADVENTURE30', 30, '2025-05-08 23:59:59+00', 8, 8, 108),
('LAKE10', 10, '2025-05-09 23:59:59+00', 9, 9, 109),
('CLIMB25', 25, '2025-05-10 23:59:59+00', 10, 10, 110);

-- 3. payments."ShoppingCarts"
INSERT INTO payments."ShoppingCarts" ("TouristId", "OrderItems", "Total") VALUES
(1, '[{"TourId": 1, "Name": "Uspon na Taru", "Price": 100.0}]'::jsonb, 100.0),
(2, '[{"TourId": 2, "Name": "Jezero Perućac", "Price": 50.0}, {"TourId": 3, "Name": "Stari Ras", "Price": 80.0}]'::jsonb, 130.0),
(3, '[{"TourId": 4, "Name": "Fruška Gora", "Price": 120.0}]'::jsonb, 120.0),
(4, '[{"TourId": 5, "Name": "Pećina Resava", "Price": 90.0}]'::jsonb, 90.0),
(5, '[{"TourId": 6, "Name": "Drinska avantura", "Price": 150.0}, {"TourId": 7, "Name": "Zlatiborska staza", "Price": 110.0}]'::jsonb, 260.0),
(6, '[{"TourId": 8, "Name": "Sopotnica", "Price": 60.0}]'::jsonb, 60.0),
(7, '[{"TourId": 9, "Name": "Kopaonik", "Price": 130.0}]'::jsonb, 130.0),
(8, '[{"TourId": 10, "Name": "Đerdapska klisura", "Price": 100.0}]'::jsonb, 100.0),
(9, '[{"TourId": 1, "Name": "Uspon na Taru", "Price": 100.0}, {"TourId": 2, "Name": "Jezero Perućac", "Price": 50.0}]'::jsonb, 150.0),
(10, '[{"TourId": 3, "Name": "Stari Ras", "Price": 80.0}, {"TourId": 4, "Name": "Fruška Gora", "Price": 120.0}]'::jsonb, 200.0);

-- 4. payments."TourPurchaseTokens"
INSERT INTO payments."TourPurchaseTokens" ("TouristId", "IdTour") VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- 5. payments."TourSale"
INSERT INTO payments."TourSale" ("TourIds", "StartDate", "EndDate", "SalePercentage", "AuthorId") VALUES
(ARRAY[1, 2], '2025-04-01 00:00:00+00', '2025-04-07 23:59:59+00', 10, 101),
(ARRAY[3], '2025-04-02 00:00:00+00', '2025-04-08 23:59:59+00', 15, 102),
(ARRAY[4, 5], '2025-04-03 00:00:00+00', '2025-04-09 23:59:59+00', 20, 103),
(ARRAY[6], '2025-04-04 00:00:00+00', '2025-04-10 23:59:59+00', 25, 104),
(ARRAY[7, 8], '2025-04-05 00:00:00+00', '2025-04-11 23:59:59+00', 30, 105),
(ARRAY[9], '2025-04-06 00:00:00+00', '2025-04-12 23:59:59+00', 10, 106),
(ARRAY[10], '2025-04-07 00:00:00+00', '2025-04-13 23:59:59+00', 15, 107),
(ARRAY[1, 3], '2025-04-08 00:00:00+00', '2025-04-14 23:59:59+00', 20, 108),
(ARRAY[2, 4], '2025-04-09 00:00:00+00', '2025-04-15 23:59:59+00', 25, 109),
(ARRAY[5, 6], '2025-04-10 00:00:00+00', '2025-04-16 23:59:59+00', 30, 110);