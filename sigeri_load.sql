INSERT INTO user(id,name,unit_id,email,password,detail) VALUES 
(1,'admin',1,'admin@admin.com','admin','Administrator'),
(2,'luizerico',1,'admin@admin.com','123456','Administrator');



-- Threat --

INSERT INTO threatsource (id, name, description) VALUES 
(1, "Hacker, Craker",""),
(2, "Computer Criminal",""),
(3, "Terrorist",""),
(4, "Industrial Spionage",""),
(5, "Insiders","");

INSERT INTO threatlevel (id, value, description) VALUES 
(1, 1,"Very Low"),
(2, 2,"Low"),
(3, 3,"Medium"),
(4, 4,"High"),
(5, 5,"Very High");

INSERT INTO threattype (id, name, description) VALUES 
(1, "Physical damage",""),
(2, "Natural events",""),
(3, "Loss of essential services",""),
(4, "Disturbance due to radiation",""),
(5, "Compromise of information",""),
(6, "Technical failures",""),
(7, "Unauthorised actions",""),
(8, "Compromise of functions","");

INSERT INTO threat (id, name, level_id, type_id, analyst_id, deliberate, accidental, environmental) VALUES
(1, "Fire", 3, 1, 1, 1, 1, 1),
(2, "Water damage", 3, 1, 1, 1, 1, 1),
(3, "Pollution", 3, 1, 1, 1, 1, 1),
(4, "Major accident", 3, 1, 1, 1, 1, 1),
(5, "Destruction of equipment or media", 3, 1, 1, 1, 1, 1),
(6, "Dust, corrosion, freezing", 3, 1, 1, 1, 1, 1);



-- Vulnerability --





