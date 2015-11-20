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

INSERT INTO vulnerabilitytype (id, name) VALUES 
(1, "Hardware"),
(2, "Software"),
(3, "Network"),
(4, "Personnel"),
(5, "Site"),
(6, "Organization");

INSERT INTO vulnerabilitylevel (id, value, description) VALUES 
(1, 1,"Very Low"),
(2, 2,"Low"),
(3, 3,"Medium"),
(4, 4,"High"),
(5, 5,"Very High");

INSERT INTO vulnerability (id, name, level_id, type_id, analyst_id) VALUES
(1, "Insufficient maintenance", 3, 1, 1),
(2, "Lack of periodic replacement schemes", 3, 1, 1),
(3, "Susceptibility to humidity, dust, soiling", 3, 1, 1),
(4, "Sensitivity to eletromagnetic radiation", 3, 1, 1),
(5, "Lack of efficient configuration change control", 3, 1, 1),
(6, "Susceptibility to voltage variations", 3, 1, 1),
(7, "Susceptibility to temperature variations", 3, 1, 1),
(8, "Unprotected Storage", 3, 1, 1),
(9, "Lack of care at disposal", 3, 1, 1),
(10, "Uncontrolled copying", 3, 1, 1);


-- Impact and likelihood

INSERT INTO impact (id, value, description) VALUES 
(1, 1,"Very Low"),
(2, 2,"Low"),
(3, 3,"Medium"),
(4, 4,"High"),
(5, 5,"Very High");

INSERT INTO probability (id, value, description) VALUES 
(1, 1,"Very Low"),
(2, 2,"Low"),
(3, 3,"Medium"),
(4, 4,"High"),
(5, 5,"Very High");


-- Risk

INSERT INTO risktype (id, name, description) VALUES 
(1, "Accounting risk",""),
(2, "Brand risk",""),
(3, "Credit risk",""),
(4, "Environmental risk",""),
(5, "Innovational or technical obsolesce risk",""),
(6, "Legal riskInflation and recession risk",""),
(7, "Liability risk",""),
(8, "Longevity",""),
(9, "Market risk",""),
(10, "Mortality and morbidity risk",""),
(11, "Operational risk",""),
(12, "Physical damage risk",""),
(13, "Political risk",""),
(14, "Product risk",""),
(15, "Regulatory risk",""),
(16, "Reputational risk",""),
(17, "Strategic risk","");



