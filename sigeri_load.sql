
insert into threatsource (id, name, description) values 
(1, "Hacker, Craker",""),
(2, "Computer Criminal",""),
(3, "Terrorist",""),
(4, "Industrial Spionage",""),
(5, "Insiders","");

insert into threatlevel (id, value, description) values 
(1, 1,"Very Low"),
(2, 2,"Low"),
(3, 3,"Medium"),
(4, 4,"High"),
(5, 5,"Very High");

insert into threattype (id, name, description) values 
(1, "Physical damage",""),
(2, "Natural events",""),
(3, "Loss of essential services",""),
(4, "Disturbance due to radiation",""),
(5, "Compromise of information",""),
(6, "Technical failures",""),
(7, "Unauthorised actions",""),
(8, "Compromise of functions","");

insert into threat (id, name, level, type, source, analyst, description, annotations) values
(1, "Fire", 1, 1, 1, 1, "", ""),
(2, "Water damage", 1, 1, 1, 1, "", ""),
(3, "Pollution", 1, 1, 1, 1, "", ""),
(4, "Major accident", 1, 1, 1, 1, "", ""),
(5, "Destruction of equipment or media", 1, 1, 1, 1, "", ""),
(6, "Dust, corrosion, freezing", 1, 1, 1, 1, "", "");




