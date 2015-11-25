INSERT INTO user(id,username,name,unit_id,email,password,detail) VALUES 
(1,'admin','admin',1,'admin@admin.com','admin','Administrator'),
(2,'manager01','manager01',1,'manager01@admin.com','123456','Manager'),
(3,'analist01','analist01',1,'analist01@admin.com','123456','IT analist'),
(4,'analist02','analist02',1,'analist02@admin.com','123456','Process analist'),
(5,'luizerico','Luiz Erico',1,'admin@admin.com','123456','creator');



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

INSERT INTO likelihood (id, value, description) VALUES 
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

INSERT INTO riskstatus (id, name, description) VALUES 
(1, "Untreated",""),
(2, "Planned",""),
(3, "Treated",""),
(4, "Obsolete",""),
(5, "Irrelevant","");

INSERT INTO `risk` (id, status_id, type_id, likelihood_id, impact_id, analyst_id, name, date, description, annotations) VALUES  
(1,1,11,4,4,3,'Unplanned/unapproved changes','2015-10-12','',''),
(2,3,11,3,4,3,'Version control problems','2015-10-12','',''),
(3,3,11,2,2,3,'Inconsistent documentation','2015-10-12','',''),
(4,1,11,5,3,3,'Lack of reporting','2015-10-12','',''),

(5,3,11,2,4,3,'Role confusion','2015-10-12','',''),
(6,3,11,1,4,3,'Lack of issue identification','2015-10-12','',''),
(7,3,5,3,3,3,'Lack of procedures to secure the systems','2015-10-12','',''),
(8,5,5,5,4,3,'Obsolete controls','2015-10-12','',''),

(9,3,4,1,5,3,'Disasters','2015-10-12','',''),
(10,3,11,2,4,3,'Hardware failure','2015-10-12','',''),
(11,5,11,4,3,3,'Software failure','2015-10-12','',''),
(12,1,11,3,3,3,'Integration with existing systems','2015-10-12','',''),

(13,1,11,1,4,3,'Contingency equipment availability','2015-10-12','',''),
(14,5,11,3,4,3,'Lack of skills/knowledge','2015-10-12','',''),
(15,5,11,4,3,3,'Not aware of policy/procedures','2015-10-12','',''),
(16,5,11,3,3,3,'Changes of personnel','2015-10-12','',''),
(17,5,11,3,4,3,'Inability to perform core business activities','2015-10-12','',''),
(18,5,11,3,2,3,'Inability to perform non-core business activities','2015-10-12','',''),
(19,3,16,2,3,3,'User expectations','2015-10-12','','')
;


-- Asset
INSERT INTO assettype (id, name, description) VALUES 
(1, "Generic Server",""),
(2, "Web Server",""),
(3, "DNS Server",""),
(4, "Application Server",""),
(5, "File Server","");

INSERT INTO assetrelevance (id, value, description) VALUES 
(1, 1, "No significant losses."),
(2, 2, "Low probability of monetary and reputation loss."),
(3, 3, "Possible monetary and reputation loss."),
(4, 4, "High probability of monetary, reputation and legal loss."),
(5, 5, "Great monetary losses with high reputation and legal impact.");

INSERT INTO consequence (id, name, description) VALUES 
(1, "Violation of legislation and/or regulation",""),
(2, "Impairment of business performance",""),
(3, "Loss of goodwill/negative effect on reputation",""),
(4, "Breach associated with personal information",""),
(5, "Endangerment of personal safety",""),
(6, "Adverse effects on law enforcement",""),
(7, "Breach of confidentiality",""),
(8, "Breach of public order",""),
(9, "Financial loss",""),
(10, "Disruption to business activities",""),
(11, "Endangerment of environmental safety","");

INSERT INTO `asset` (id, type_id, analyst_id, unit_id, name, description, discr, value_id) VALUES 
(1,1,1,1,'WWW_01','','serverasset',1),
(2,1,1,1,'WWW_02','','serverasset',1),
(3,2,2,1,'DNS_003','','serverasset',2),
(4,1,1,1,'DNS_004','','serverasset',2),
(5,1,1,1,'FILESERVER_05','','serverasset',2),
(6,2,2,1,'SAMBA_06','','serverasset',2),
(7,1,1,1,'SAMBA_07','','serverasset',5),
(8,1,1,1,'APPSERVER_08','','serverasset',5),
(9,2,2,1,'APPSERVER_09','','serverasset',5),
(10,1,1,1,'APPSERVER_10','','serverasset',5),
(11,1,1,1,'JBOSS_11','','serverasset',5),
(12,2,2,1,'JBOSS_12','','serverasset',5),
(13,1,1,1,'SQLSERVER_13','','serverasset',1),
(14,1,1,1,'POSTGRES_14','','serverasset',1),
(15,2,2,1,'ORACLE_15','','serverasset',3);

INSERT INTO `serverasset` VALUES 
(1,'1.1.1.1'),
(2,'1.1.1.2'),
(3,'1.1.1.3'),
(4,'1.1.1.4'),
(5,'1.1.1.5'),
(6,'1.1.1.6'),
(7,'1.1.1.7'),
(8,'1.1.1.8'),
(9,'1.1.1.9'),
(10,'1.1.1.10'),
(11,'1.1.1.11'),
(12,'1.1.1.12'),
(13,'1.1.1.13'),
(14,'1.1.1.14'),
(15,'1.1.1.15');

INSERT INTO risk_asset (asset_id, risk_id) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,7),
(1,9),
(2,4),
(2,5),
(2,9),
(2,11),
(2,14),
(2,17),
(3,11),
(3,12),
(4,17),
(5,1),
(5,11),
(5,19),
(6,1),
(7,1),
(8,1),
(9,1),
(9,4),
(9,7),
(9,19),
(10,18),
(11,17),
(12,16),
(13,14),
(14,15),
(15,10),
(15,11),
(15,12),
(15,13);




