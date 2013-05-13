use ztp;

drop table Gtable;

CREATE TABLE Gtable ( 
 id int NOT NULL IDENTITY, 
 x int NOT NULL, 
 y int NOT NULL, 
 p float NOT NULL, 
PRIMARY KEY ( id )
);
SET IDENTITY_INSERT Gtable ON;

select * from Gtable;


-- 1 - 3 --> 90.01
insert into gtable (x,y,p) values 
(0,1,90.01),
(0,2,70.01),
(1,3,100.01),
(2,3,120.01),
(2,1,10.01);


-- 1 - 3 --> 90.01
insert into gtable (x,y,p) values 
(0,1,90.01),
(0,2,70.01),
(1,3,100.01),
(2,3,120.01),
(2,1,10.01),
(0,4,1000.01),
(4,3,10.01);


-- 1 - 9 --> 5
insert into gtable values (1,2,8);
insert into gtable values (1,3,5);
insert into gtable values (2,5,1);
insert into gtable values (3,4,7);
insert into gtable values (4,6,6);
insert into gtable values (5,6,8);
insert into gtable values (5,7,5);
insert into gtable values (6,8,2);
insert into gtable values (7,8,2);
insert into gtable values (7,9,9);
insert into gtable values (8,9,2);


-- 1 - 9 --> 34.502
INSERT INTO Gtable (x, y, p) VALUES (54, 26, 49.973686);
INSERT INTO Gtable (x, y, p) VALUES (69, 93, 11.188117);
INSERT INTO Gtable (x, y, p) VALUES (87, 67, 11.944389);
INSERT INTO Gtable (x, y, p) VALUES (34, 48, 39.41146);
INSERT INTO Gtable (x, y, p) VALUES (30, 9, 42.99283);
INSERT INTO Gtable (x, y, p) VALUES (24, 50, 15.5312);
INSERT INTO Gtable (x, y, p) VALUES (79, 50, 24.371073);
INSERT INTO Gtable (x, y, p) VALUES (71, 95, 28.601656);
INSERT INTO Gtable (x, y, p) VALUES (60, 94, 34.452595);
INSERT INTO Gtable (x, y, p) VALUES (47, 87, 44.67661);
INSERT INTO Gtable (x, y, p) VALUES (92, 78, 30.601212);
INSERT INTO Gtable (x, y, p) VALUES (8, 64, 20.080853);
INSERT INTO Gtable (x, y, p) VALUES (35, 78, 19.966932);
INSERT INTO Gtable (x, y, p) VALUES (45, 72, 5.32071);
INSERT INTO Gtable (x, y, p) VALUES (98, 87, 22.776497);
INSERT INTO Gtable (x, y, p) VALUES (34, 8, 31.503359);
INSERT INTO Gtable (x, y, p) VALUES (33, 83, 42.701996);
INSERT INTO Gtable (x, y, p) VALUES (65, 64, 6.036928);
INSERT INTO Gtable (x, y, p) VALUES (66, 24, 39.93077);
INSERT INTO Gtable (x, y, p) VALUES (98, 50, 45.479366);
INSERT INTO Gtable (x, y, p) VALUES (61, 71, 31.358418);
INSERT INTO Gtable (x, y, p) VALUES (79, 85, 13.476181);
INSERT INTO Gtable (x, y, p) VALUES (33, 44, 46.322575);
INSERT INTO Gtable (x, y, p) VALUES (31, 25, 7.644108);
INSERT INTO Gtable (x, y, p) VALUES (62, 57, 2.3453116);
INSERT INTO Gtable (x, y, p) VALUES (55, 75, 28.507265);
INSERT INTO Gtable (x, y, p) VALUES (76, 24, 42.977047);
INSERT INTO Gtable (x, y, p) VALUES (19, 65, 34.79484);
INSERT INTO Gtable (x, y, p) VALUES (22, 61, 29.752878);
INSERT INTO Gtable (x, y, p) VALUES (21, 2, 34.97512);
INSERT INTO Gtable (x, y, p) VALUES (56, 55, 5.9149356);
INSERT INTO Gtable (x, y, p) VALUES (83, 20, 28.6813);
INSERT INTO Gtable (x, y, p) VALUES (6, 56, 47.70013);
INSERT INTO Gtable (x, y, p) VALUES (21, 81, 1.6595334);
INSERT INTO Gtable (x, y, p) VALUES (67, 81, 16.586452);
INSERT INTO Gtable (x, y, p) VALUES (37, 11, 33.593075);
INSERT INTO Gtable (x, y, p) VALUES (90, 70, 3.5575986);
INSERT INTO Gtable (x, y, p) VALUES (86, 18, 4.8785954);
INSERT INTO Gtable (x, y, p) VALUES (27, 45, 15.143275);
INSERT INTO Gtable (x, y, p) VALUES (84, 80, 24.496746);
INSERT INTO Gtable (x, y, p) VALUES (59, 18, 26.689);
INSERT INTO Gtable (x, y, p) VALUES (3, 60, 2.4311662);
INSERT INTO Gtable (x, y, p) VALUES (44, 89, 20.500044);
INSERT INTO Gtable (x, y, p) VALUES (43, 68, 45.114964);
INSERT INTO Gtable (x, y, p) VALUES (37, 84, 29.832756);
INSERT INTO Gtable (x, y, p) VALUES (46, 74, 33.36193);
INSERT INTO Gtable (x, y, p) VALUES (62, 24, 23.878014);
INSERT INTO Gtable (x, y, p) VALUES (18, 37, 2.9567838);
INSERT INTO Gtable (x, y, p) VALUES (95, 25, 10.50826);
INSERT INTO Gtable (x, y, p) VALUES (77, 91, 45.729633);
INSERT INTO Gtable (x, y, p) VALUES (93, 1, 34.50243);
INSERT INTO Gtable (x, y, p) VALUES (23, 39, 47.318752);
INSERT INTO Gtable (x, y, p) VALUES (53, 16, 49.182266);
INSERT INTO Gtable (x, y, p) VALUES (98, 22, 31.252369);
INSERT INTO Gtable (x, y, p) VALUES (55, 39, 18.25002);
INSERT INTO Gtable (x, y, p) VALUES (69, 77, 1.0648757);
INSERT INTO Gtable (x, y, p) VALUES (24, 72, 43.01027);
INSERT INTO Gtable (x, y, p) VALUES (86, 30, 10.699424);
INSERT INTO Gtable (x, y, p) VALUES (24, 5, 36.815693);
INSERT INTO Gtable (x, y, p) VALUES (92, 6, 12.4138775);
INSERT INTO Gtable (x, y, p) VALUES (89, 78, 17.262114);
INSERT INTO Gtable (x, y, p) VALUES (27, 59, 43.223114);
INSERT INTO Gtable (x, y, p) VALUES (36, 92, 26.983711);
INSERT INTO Gtable (x, y, p) VALUES (97, 10, 6.836301);
INSERT INTO Gtable (x, y, p) VALUES (1, 13, 46.8811);
INSERT INTO Gtable (x, y, p) VALUES (84, 39, 1.7197877);
INSERT INTO Gtable (x, y, p) VALUES (59, 43, 26.03767);
INSERT INTO Gtable (x, y, p) VALUES (76, 53, 24.783384);
INSERT INTO Gtable (x, y, p) VALUES (94, 54, 13.684675);
INSERT INTO Gtable (x, y, p) VALUES (58, 1, 1.7402768);
INSERT INTO Gtable (x, y, p) VALUES (3, 60, 40.509117);
INSERT INTO Gtable (x, y, p) VALUES (67, 55, 19.593548);
INSERT INTO Gtable (x, y, p) VALUES (14, 75, 38.510544);
INSERT INTO Gtable (x, y, p) VALUES (13, 66, 4.617563);
INSERT INTO Gtable (x, y, p) VALUES (27, 28, 45.223053);
INSERT INTO Gtable (x, y, p) VALUES (77, 47, 33.279617);
INSERT INTO Gtable (x, y, p) VALUES (45, 83, 45.005737);
INSERT INTO Gtable (x, y, p) VALUES (19, 23, 34.2442);
INSERT INTO Gtable (x, y, p) VALUES (93, 57, 7.920843);
INSERT INTO Gtable (x, y, p) VALUES (13, 99, 30.687765);
INSERT INTO Gtable (x, y, p) VALUES (73, 80, 42.952866);
INSERT INTO Gtable (x, y, p) VALUES (13, 22, 48.432922);
INSERT INTO Gtable (x, y, p) VALUES (13, 60, 40.191875);
INSERT INTO Gtable (x, y, p) VALUES (30, 50, 24.903484);
INSERT INTO Gtable (x, y, p) VALUES (10, 52, 14.076588);
INSERT INTO Gtable (x, y, p) VALUES (81, 18, 48.86876);
INSERT INTO Gtable (x, y, p) VALUES (69, 81, 27.682161);
INSERT INTO Gtable (x, y, p) VALUES (20, 100, 6.8956614);
INSERT INTO Gtable (x, y, p) VALUES (28, 58, 44.56652);
INSERT INTO Gtable (x, y, p) VALUES (61, 7, 31.366877);
INSERT INTO Gtable (x, y, p) VALUES (52, 25, 24.823936);
INSERT INTO Gtable (x, y, p) VALUES (81, 7, 18.840286);
INSERT INTO Gtable (x, y, p) VALUES (17, 46, 43.32684);
INSERT INTO Gtable (x, y, p) VALUES (95, 74, 40.26204);
INSERT INTO Gtable (x, y, p) VALUES (58, 51, 40.98987);
INSERT INTO Gtable (x, y, p) VALUES (14, 86, 44.923027);
INSERT INTO Gtable (x, y, p) VALUES (89, 29, 7.7978163);
INSERT INTO Gtable (x, y, p) VALUES (81, 83, 16.267866);
INSERT INTO Gtable (x, y, p) VALUES (95, 67, 33.95888);
INSERT INTO Gtable (x, y, p) VALUES (17, 83, 2.7256668);
INSERT INTO Gtable (x, y, p) VALUES (4, 30, 34.514282);
INSERT INTO Gtable (x, y, p) VALUES (80, 39, 46.769157);
INSERT INTO Gtable (x, y, p) VALUES (93, 15, 21.920773);
INSERT INTO Gtable (x, y, p) VALUES (85, 11, 37.56502);
INSERT INTO Gtable (x, y, p) VALUES (19, 13, 6.137946);
INSERT INTO Gtable (x, y, p) VALUES (100, 30, 46.180897);
INSERT INTO Gtable (x, y, p) VALUES (84, 67, 19.57071);
INSERT INTO Gtable (x, y, p) VALUES (21, 58, 16.852983);
INSERT INTO Gtable (x, y, p) VALUES (95, 47, 22.136269);
INSERT INTO Gtable (x, y, p) VALUES (78, 47, 3.37255);
INSERT INTO Gtable (x, y, p) VALUES (5, 29, 35.873085);
INSERT INTO Gtable (x, y, p) VALUES (37, 69, 0.13017654);
INSERT INTO Gtable (x, y, p) VALUES (30, 75, 5.53492);
INSERT INTO Gtable (x, y, p) VALUES (38, 98, 24.086031);
INSERT INTO Gtable (x, y, p) VALUES (79, 3, 38.12153);
INSERT INTO Gtable (x, y, p) VALUES (42, 91, 36.80889);
INSERT INTO Gtable (x, y, p) VALUES (37, 16, 32.042877);
INSERT INTO Gtable (x, y, p) VALUES (64, 47, 21.35756);
INSERT INTO Gtable (x, y, p) VALUES (77, 65, 7.396254);
INSERT INTO Gtable (x, y, p) VALUES (20, 8, 49.72908);
INSERT INTO Gtable (x, y, p) VALUES (27, 67, 11.481208);
INSERT INTO Gtable (x, y, p) VALUES (96, 8, 42.994164);
INSERT INTO Gtable (x, y, p) VALUES (89, 55, 36.423515);
INSERT INTO Gtable (x, y, p) VALUES (3, 9, 10.736763);
INSERT INTO Gtable (x, y, p) VALUES (5, 25, 40.825268);
INSERT INTO Gtable (x, y, p) VALUES (95, 86, 35.68071);
INSERT INTO Gtable (x, y, p) VALUES (87, 71, 0.27019382);
INSERT INTO Gtable (x, y, p) VALUES (88, 45, 9.960402);
INSERT INTO Gtable (x, y, p) VALUES (54, 46, 6.62497);
INSERT INTO Gtable (x, y, p) VALUES (17, 25, 43.046543);
INSERT INTO Gtable (x, y, p) VALUES (66, 59, 19.949034);
INSERT INTO Gtable (x, y, p) VALUES (30, 74, 24.078005);
INSERT INTO Gtable (x, y, p) VALUES (54, 13, 45.27337);
INSERT INTO Gtable (x, y, p) VALUES (39, 22, 44.465466);
INSERT INTO Gtable (x, y, p) VALUES (72, 95, 16.650051);
INSERT INTO Gtable (x, y, p) VALUES (18, 56, 29.396067);
INSERT INTO Gtable (x, y, p) VALUES (80, 52, 28.067148);
INSERT INTO Gtable (x, y, p) VALUES (16, 95, 11.18043);
INSERT INTO Gtable (x, y, p) VALUES (20, 62, 31.328007);
INSERT INTO Gtable (x, y, p) VALUES (95, 11, 42.22919);
INSERT INTO Gtable (x, y, p) VALUES (72, 63, 44.605198);
INSERT INTO Gtable (x, y, p) VALUES (77, 41, 21.934956);
INSERT INTO Gtable (x, y, p) VALUES (85, 8, 18.235168);
INSERT INTO Gtable (x, y, p) VALUES (55, 20, 4.074016);
INSERT INTO Gtable (x, y, p) VALUES (83, 2, 10.5086775);
INSERT INTO Gtable (x, y, p) VALUES (8, 14, 26.27688);
INSERT INTO Gtable (x, y, p) VALUES (66, 24, 27.757751);
INSERT INTO Gtable (x, y, p) VALUES (42, 26, 20.078295);
INSERT INTO Gtable (x, y, p) VALUES (61, 76, 11.265886);
INSERT INTO Gtable (x, y, p) VALUES (27, 98, 16.413446);
INSERT INTO Gtable (x, y, p) VALUES (73, 7, 10.750998);
INSERT INTO Gtable (x, y, p) VALUES (21, 34, 31.95111);
INSERT INTO Gtable (x, y, p) VALUES (29, 100, 3.1015158);
INSERT INTO Gtable (x, y, p) VALUES (93, 96, 38.49759);
INSERT INTO Gtable (x, y, p) VALUES (79, 30, 24.224388);
INSERT INTO Gtable (x, y, p) VALUES (36, 72, 16.846292);
INSERT INTO Gtable (x, y, p) VALUES (77, 70, 28.87763);
INSERT INTO Gtable (x, y, p) VALUES (9, 10, 48.788128);
INSERT INTO Gtable (x, y, p) VALUES (53, 24, 13.550332);
INSERT INTO Gtable (x, y, p) VALUES (17, 91, 0.950408);
INSERT INTO Gtable (x, y, p) VALUES (86, 41, 4.234129);
INSERT INTO Gtable (x, y, p) VALUES (75, 50, 5.74632);
INSERT INTO Gtable (x, y, p) VALUES (17, 64, 14.796293);
INSERT INTO Gtable (x, y, p) VALUES (94, 72, 15.060702);
INSERT INTO Gtable (x, y, p) VALUES (71, 81, 8.392504);
INSERT INTO Gtable (x, y, p) VALUES (92, 40, 4.0199575);
INSERT INTO Gtable (x, y, p) VALUES (91, 27, 8.845228);
INSERT INTO Gtable (x, y, p) VALUES (69, 71, 21.856155);
INSERT INTO Gtable (x, y, p) VALUES (62, 93, 49.54655);
INSERT INTO Gtable (x, y, p) VALUES (74, 89, 42.8564);
INSERT INTO Gtable (x, y, p) VALUES (95, 81, 46.798817);
INSERT INTO Gtable (x, y, p) VALUES (87, 87, 13.825506);
INSERT INTO Gtable (x, y, p) VALUES (10, 24, 5.658293);
INSERT INTO Gtable (x, y, p) VALUES (10, 94, 8.927223);
INSERT INTO Gtable (x, y, p) VALUES (33, 43, 29.973629);
INSERT INTO Gtable (x, y, p) VALUES (66, 87, 12.866536);
INSERT INTO Gtable (x, y, p) VALUES (100, 85, 34.222076);
INSERT INTO Gtable (x, y, p) VALUES (33, 95, 20.209297);
INSERT INTO Gtable (x, y, p) VALUES (59, 64, 2.4159045);
INSERT INTO Gtable (x, y, p) VALUES (69, 95, 48.82745);
INSERT INTO Gtable (x, y, p) VALUES (66, 8, 5.4531665);
INSERT INTO Gtable (x, y, p) VALUES (22, 55, 13.537559);
INSERT INTO Gtable (x, y, p) VALUES (76, 68, 5.184767);
INSERT INTO Gtable (x, y, p) VALUES (10, 65, 24.108242);
INSERT INTO Gtable (x, y, p) VALUES (78, 55, 1.042077);
INSERT INTO Gtable (x, y, p) VALUES (10, 59, 28.03031);
INSERT INTO Gtable (x, y, p) VALUES (5, 91, 39.188007);
INSERT INTO Gtable (x, y, p) VALUES (18, 93, 34.731354);
INSERT INTO Gtable (x, y, p) VALUES (29, 58, 8.578285);
INSERT INTO Gtable (x, y, p) VALUES (78, 87, 40.814106);
INSERT INTO Gtable (x, y, p) VALUES (85, 19, 22.69498);
INSERT INTO Gtable (x, y, p) VALUES (50, 95, 7.848725);
INSERT INTO Gtable (x, y, p) VALUES (63, 27, 30.817455);
INSERT INTO Gtable (x, y, p) VALUES (83, 1, 0.58592856);
INSERT INTO Gtable (x, y, p) VALUES (7, 47, 4.987058);
INSERT INTO Gtable (x, y, p) VALUES (17, 95, 29.767714);
INSERT INTO Gtable (x, y, p) VALUES (84, 55, 9.818056);
INSERT INTO Gtable (x, y, p) VALUES (96, 30, 40.508656);
INSERT INTO Gtable (x, y, p) VALUES (44, 31, 24.220667);
INSERT INTO Gtable (x, y, p) VALUES (87, 48, 43.510963);








-- 1 - 9 --> 38.447
INSERT INTO Gtable (x, y, p) VALUES (24, 53, 47.596977);
INSERT INTO Gtable (x, y, p) VALUES (86, 22, 42.557655);
INSERT INTO Gtable (x, y, p) VALUES (24, 68, 1.4320463);
INSERT INTO Gtable (x, y, p) VALUES (67, 87, 9.320652);
INSERT INTO Gtable (x, y, p) VALUES (11, 81, 6.9367914);
INSERT INTO Gtable (x, y, p) VALUES (66, 19, 48.357788);
INSERT INTO Gtable (x, y, p) VALUES (82, 2, 18.836155);
INSERT INTO Gtable (x, y, p) VALUES (64, 51, 26.519987);
INSERT INTO Gtable (x, y, p) VALUES (69, 31, 16.196167);
INSERT INTO Gtable (x, y, p) VALUES (78, 24, 2.645868);
INSERT INTO Gtable (x, y, p) VALUES (8, 65, 49.94773);
INSERT INTO Gtable (x, y, p) VALUES (88, 79, 28.288284);
INSERT INTO Gtable (x, y, p) VALUES (12, 64, 6.9874377);
INSERT INTO Gtable (x, y, p) VALUES (41, 53, 6.342697);
INSERT INTO Gtable (x, y, p) VALUES (36, 32, 7.361847);
INSERT INTO Gtable (x, y, p) VALUES (69, 79, 13.549768);
INSERT INTO Gtable (x, y, p) VALUES (32, 77, 27.423853);
INSERT INTO Gtable (x, y, p) VALUES (5, 14, 47.86766);
INSERT INTO Gtable (x, y, p) VALUES (75, 57, 28.378874);
INSERT INTO Gtable (x, y, p) VALUES (63, 10, 3.7402213);
INSERT INTO Gtable (x, y, p) VALUES (28, 37, 6.1246037);
INSERT INTO Gtable (x, y, p) VALUES (61, 8, 46.849007);
INSERT INTO Gtable (x, y, p) VALUES (11, 58, 43.187283);
INSERT INTO Gtable (x, y, p) VALUES (77, 25, 18.69598);
INSERT INTO Gtable (x, y, p) VALUES (46, 44, 37.775467);
INSERT INTO Gtable (x, y, p) VALUES (9, 84, 22.334694);
INSERT INTO Gtable (x, y, p) VALUES (88, 6, 1.4849216);
INSERT INTO Gtable (x, y, p) VALUES (68, 60, 45.914963);
INSERT INTO Gtable (x, y, p) VALUES (95, 64, 9.951702);
INSERT INTO Gtable (x, y, p) VALUES (7, 22, 31.393436);
INSERT INTO Gtable (x, y, p) VALUES (15, 85, 48.571854);
INSERT INTO Gtable (x, y, p) VALUES (7, 43, 2.2499144);
INSERT INTO Gtable (x, y, p) VALUES (13, 56, 31.114561);
INSERT INTO Gtable (x, y, p) VALUES (89, 75, 42.668076);
INSERT INTO Gtable (x, y, p) VALUES (48, 7, 1.5298396);
INSERT INTO Gtable (x, y, p) VALUES (13, 23, 30.215591);
INSERT INTO Gtable (x, y, p) VALUES (25, 60, 15.509936);
INSERT INTO Gtable (x, y, p) VALUES (11, 4, 40.79578);
INSERT INTO Gtable (x, y, p) VALUES (23, 36, 15.150345);
INSERT INTO Gtable (x, y, p) VALUES (71, 7, 19.202753);
INSERT INTO Gtable (x, y, p) VALUES (98, 15, 39.01143);
INSERT INTO Gtable (x, y, p) VALUES (22, 36, 47.784534);
INSERT INTO Gtable (x, y, p) VALUES (90, 81, 47.590725);
INSERT INTO Gtable (x, y, p) VALUES (57, 98, 21.99457);
INSERT INTO Gtable (x, y, p) VALUES (32, 16, 38.11464);
INSERT INTO Gtable (x, y, p) VALUES (48, 20, 7.419613);
INSERT INTO Gtable (x, y, p) VALUES (1, 52, 25.853365);
INSERT INTO Gtable (x, y, p) VALUES (55, 95, 22.171038);
INSERT INTO Gtable (x, y, p) VALUES (34, 64, 12.626592);
INSERT INTO Gtable (x, y, p) VALUES (20, 97, 46.896572);
INSERT INTO Gtable (x, y, p) VALUES (26, 78, 8.83787);
INSERT INTO Gtable (x, y, p) VALUES (26, 64, 29.953781);
INSERT INTO Gtable (x, y, p) VALUES (43, 66, 46.895077);
INSERT INTO Gtable (x, y, p) VALUES (2, 75, 34.313328);
INSERT INTO Gtable (x, y, p) VALUES (64, 42, 0.37615895);
INSERT INTO Gtable (x, y, p) VALUES (98, 52, 45.57026);
INSERT INTO Gtable (x, y, p) VALUES (28, 9, 38.447083);
INSERT INTO Gtable (x, y, p) VALUES (19, 46, 21.920225);
INSERT INTO Gtable (x, y, p) VALUES (85, 22, 0.005030632);
INSERT INTO Gtable (x, y, p) VALUES (36, 8, 16.679987);
INSERT INTO Gtable (x, y, p) VALUES (83, 39, 0.88190734);
INSERT INTO Gtable (x, y, p) VALUES (91, 23, 48.485165);
INSERT INTO Gtable (x, y, p) VALUES (56, 64, 5.6615205);
INSERT INTO Gtable (x, y, p) VALUES (32, 18, 12.276533);
INSERT INTO Gtable (x, y, p) VALUES (31, 71, 16.990286);
INSERT INTO Gtable (x, y, p) VALUES (55, 52, 42.48579);
INSERT INTO Gtable (x, y, p) VALUES (81, 67, 9.622065);
INSERT INTO Gtable (x, y, p) VALUES (36, 58, 30.82228);
INSERT INTO Gtable (x, y, p) VALUES (37, 69, 41.01183);
INSERT INTO Gtable (x, y, p) VALUES (19, 96, 33.641457);
INSERT INTO Gtable (x, y, p) VALUES (35, 16, 28.18489);
INSERT INTO Gtable (x, y, p) VALUES (73, 1, 17.346352);
INSERT INTO Gtable (x, y, p) VALUES (71, 93, 36.33416);
INSERT INTO Gtable (x, y, p) VALUES (73, 67, 8.436605);
INSERT INTO Gtable (x, y, p) VALUES (35, 33, 22.37319);
INSERT INTO Gtable (x, y, p) VALUES (99, 59, 28.591846);
INSERT INTO Gtable (x, y, p) VALUES (60, 70, 17.881935);
INSERT INTO Gtable (x, y, p) VALUES (88, 86, 15.500647);
INSERT INTO Gtable (x, y, p) VALUES (69, 90, 33.58936);
INSERT INTO Gtable (x, y, p) VALUES (100, 72, 48.88198);
INSERT INTO Gtable (x, y, p) VALUES (24, 42, 21.014257);
INSERT INTO Gtable (x, y, p) VALUES (12, 92, 46.07771);
INSERT INTO Gtable (x, y, p) VALUES (44, 14, 6.1725707);
INSERT INTO Gtable (x, y, p) VALUES (9, 7, 22.625755);
INSERT INTO Gtable (x, y, p) VALUES (34, 39, 20.486588);
INSERT INTO Gtable (x, y, p) VALUES (70, 72, 30.26618);
INSERT INTO Gtable (x, y, p) VALUES (35, 33, 41.415695);
INSERT INTO Gtable (x, y, p) VALUES (100, 92, 3.8352041);
INSERT INTO Gtable (x, y, p) VALUES (32, 25, 21.447218);
INSERT INTO Gtable (x, y, p) VALUES (42, 1, 0.5007386);
INSERT INTO Gtable (x, y, p) VALUES (62, 11, 42.21499);
INSERT INTO Gtable (x, y, p) VALUES (59, 85, 33.805267);
INSERT INTO Gtable (x, y, p) VALUES (10, 38, 17.50752);
INSERT INTO Gtable (x, y, p) VALUES (21, 60, 43.99975);
INSERT INTO Gtable (x, y, p) VALUES (82, 55, 18.307161);
INSERT INTO Gtable (x, y, p) VALUES (62, 28, 46.434624);
INSERT INTO Gtable (x, y, p) VALUES (47, 54, 29.596916);
INSERT INTO Gtable (x, y, p) VALUES (5, 30, 37.063385);
INSERT INTO Gtable (x, y, p) VALUES (94, 14, 32.362904);
INSERT INTO Gtable (x, y, p) VALUES (5, 92, 26.355541);
INSERT INTO Gtable (x, y, p) VALUES (22, 84, 30.003378);
INSERT INTO Gtable (x, y, p) VALUES (23, 96, 7.4819145);
INSERT INTO Gtable (x, y, p) VALUES (40, 38, 42.141254);
INSERT INTO Gtable (x, y, p) VALUES (26, 5, 39.001842);
INSERT INTO Gtable (x, y, p) VALUES (33, 48, 13.09371);
INSERT INTO Gtable (x, y, p) VALUES (79, 53, 40.541187);
INSERT INTO Gtable (x, y, p) VALUES (92, 67, 22.772116);
INSERT INTO Gtable (x, y, p) VALUES (61, 66, 28.477339);
INSERT INTO Gtable (x, y, p) VALUES (8, 20, 22.557636);
INSERT INTO Gtable (x, y, p) VALUES (43, 86, 27.680504);
INSERT INTO Gtable (x, y, p) VALUES (44, 84, 12.050208);
INSERT INTO Gtable (x, y, p) VALUES (18, 27, 49.18946);
INSERT INTO Gtable (x, y, p) VALUES (53, 18, 2.4487674);
INSERT INTO Gtable (x, y, p) VALUES (7, 96, 30.596342);
INSERT INTO Gtable (x, y, p) VALUES (16, 44, 35.636898);
INSERT INTO Gtable (x, y, p) VALUES (7, 27, 29.872835);
INSERT INTO Gtable (x, y, p) VALUES (88, 11, 29.09438);
INSERT INTO Gtable (x, y, p) VALUES (38, 30, 13.167646);
INSERT INTO Gtable (x, y, p) VALUES (72, 40, 25.239346);
INSERT INTO Gtable (x, y, p) VALUES (47, 28, 4.128784);
INSERT INTO Gtable (x, y, p) VALUES (70, 73, 44.37468);
INSERT INTO Gtable (x, y, p) VALUES (74, 97, 47.02273);
INSERT INTO Gtable (x, y, p) VALUES (57, 70, 2.3513765);
INSERT INTO Gtable (x, y, p) VALUES (92, 65, 3.8262577);
INSERT INTO Gtable (x, y, p) VALUES (75, 27, 19.65916);
INSERT INTO Gtable (x, y, p) VALUES (33, 31, 6.7347884);
INSERT INTO Gtable (x, y, p) VALUES (5, 28, 10.897225);
INSERT INTO Gtable (x, y, p) VALUES (28, 86, 20.617899);
INSERT INTO Gtable (x, y, p) VALUES (53, 58, 48.53015);
INSERT INTO Gtable (x, y, p) VALUES (71, 52, 47.728256);
INSERT INTO Gtable (x, y, p) VALUES (32, 14, 41.23748);
INSERT INTO Gtable (x, y, p) VALUES (24, 57, 24.986565);
INSERT INTO Gtable (x, y, p) VALUES (12, 69, 15.487742);
INSERT INTO Gtable (x, y, p) VALUES (45, 68, 4.050529);
INSERT INTO Gtable (x, y, p) VALUES (52, 30, 4.3136654);
INSERT INTO Gtable (x, y, p) VALUES (65, 44, 41.310658);
INSERT INTO Gtable (x, y, p) VALUES (43, 10, 5.250719);
INSERT INTO Gtable (x, y, p) VALUES (32, 6, 6.605056);
INSERT INTO Gtable (x, y, p) VALUES (8, 65, 21.280838);
INSERT INTO Gtable (x, y, p) VALUES (44, 19, 44.67314);
INSERT INTO Gtable (x, y, p) VALUES (69, 72, 21.648184);
INSERT INTO Gtable (x, y, p) VALUES (43, 53, 22.489393);
INSERT INTO Gtable (x, y, p) VALUES (10, 79, 10.581625);
INSERT INTO Gtable (x, y, p) VALUES (11, 42, 49.884842);
INSERT INTO Gtable (x, y, p) VALUES (78, 92, 38.00911);
INSERT INTO Gtable (x, y, p) VALUES (7, 22, 47.3152);
INSERT INTO Gtable (x, y, p) VALUES (98, 33, 0.044447184);
INSERT INTO Gtable (x, y, p) VALUES (13, 28, 43.38682);
INSERT INTO Gtable (x, y, p) VALUES (41, 4, 19.442337);
INSERT INTO Gtable (x, y, p) VALUES (81, 2, 29.230362);
INSERT INTO Gtable (x, y, p) VALUES (23, 83, 46.95607);
INSERT INTO Gtable (x, y, p) VALUES (63, 57, 23.372784);
INSERT INTO Gtable (x, y, p) VALUES (16, 55, 26.467937);
INSERT INTO Gtable (x, y, p) VALUES (66, 46, 2.5837183);
INSERT INTO Gtable (x, y, p) VALUES (9, 74, 19.096037);
INSERT INTO Gtable (x, y, p) VALUES (79, 58, 5.257356);
INSERT INTO Gtable (x, y, p) VALUES (26, 16, 44.590603);
INSERT INTO Gtable (x, y, p) VALUES (91, 1, 12.382221);
INSERT INTO Gtable (x, y, p) VALUES (5, 44, 16.07781);
INSERT INTO Gtable (x, y, p) VALUES (30, 99, 7.230258);
INSERT INTO Gtable (x, y, p) VALUES (48, 99, 44.044132);
INSERT INTO Gtable (x, y, p) VALUES (9, 34, 46.843006);
INSERT INTO Gtable (x, y, p) VALUES (14, 46, 33.88845);
INSERT INTO Gtable (x, y, p) VALUES (88, 80, 1.394844);
INSERT INTO Gtable (x, y, p) VALUES (59, 80, 21.999125);
INSERT INTO Gtable (x, y, p) VALUES (76, 44, 33.23835);
INSERT INTO Gtable (x, y, p) VALUES (1, 31, 48.842472);
INSERT INTO Gtable (x, y, p) VALUES (72, 2, 18.299679);
INSERT INTO Gtable (x, y, p) VALUES (91, 75, 47.898605);
INSERT INTO Gtable (x, y, p) VALUES (27, 54, 13.011948);
INSERT INTO Gtable (x, y, p) VALUES (12, 62, 47.07353);
INSERT INTO Gtable (x, y, p) VALUES (59, 78, 28.536362);
INSERT INTO Gtable (x, y, p) VALUES (90, 64, 33.621704);
INSERT INTO Gtable (x, y, p) VALUES (39, 11, 31.797005);
INSERT INTO Gtable (x, y, p) VALUES (26, 11, 15.7046585);
INSERT INTO Gtable (x, y, p) VALUES (41, 84, 42.591045);
INSERT INTO Gtable (x, y, p) VALUES (51, 42, 39.196346);
INSERT INTO Gtable (x, y, p) VALUES (57, 71, 21.820086);
INSERT INTO Gtable (x, y, p) VALUES (79, 79, 4.7083526);
INSERT INTO Gtable (x, y, p) VALUES (18, 70, 25.990463);
INSERT INTO Gtable (x, y, p) VALUES (65, 57, 12.578833);
INSERT INTO Gtable (x, y, p) VALUES (51, 48, 21.403608);
INSERT INTO Gtable (x, y, p) VALUES (100, 26, 38.654472);
INSERT INTO Gtable (x, y, p) VALUES (80, 6, 48.759304);
INSERT INTO Gtable (x, y, p) VALUES (52, 95, 27.351141);
INSERT INTO Gtable (x, y, p) VALUES (100, 5, 24.401659);
INSERT INTO Gtable (x, y, p) VALUES (79, 23, 3.7288575);
INSERT INTO Gtable (x, y, p) VALUES (49, 26, 37.68099);
INSERT INTO Gtable (x, y, p) VALUES (11, 19, 34.284374);
INSERT INTO Gtable (x, y, p) VALUES (48, 33, 1.7799586);
INSERT INTO Gtable (x, y, p) VALUES (1, 58, 42.98843);
INSERT INTO Gtable (x, y, p) VALUES (76, 84, 34.299236);
INSERT INTO Gtable (x, y, p) VALUES (69, 16, 33.775986);
INSERT INTO Gtable (x, y, p) VALUES (86, 60, 35.886227);
INSERT INTO Gtable (x, y, p) VALUES (89, 18, 46.419167);
INSERT INTO Gtable (x, y, p) VALUES (22, 35, 47.077934);
INSERT INTO Gtable (x, y, p) VALUES (71, 22, 13.855648);
INSERT INTO Gtable (x, y, p) VALUES (88, 27, 42.800846);
INSERT INTO Gtable (x, y, p) VALUES (33, 58, 18.31907);
INSERT INTO Gtable (x, y, p) VALUES (94, 37, 9.809178);





-- 1 - 9 --> 3.454
INSERT INTO Gtable (x, y, p) VALUES (22, 27, 34.30496);
INSERT INTO Gtable (x, y, p) VALUES (75, 99, 4.6061397);
INSERT INTO Gtable (x, y, p) VALUES (7, 100, 30.30451);
INSERT INTO Gtable (x, y, p) VALUES (100, 32, 36.994823);
INSERT INTO Gtable (x, y, p) VALUES (71, 37, 19.475105);
INSERT INTO Gtable (x, y, p) VALUES (6, 69, 48.023438);
INSERT INTO Gtable (x, y, p) VALUES (79, 51, 20.280657);
INSERT INTO Gtable (x, y, p) VALUES (52, 60, 37.90826);
INSERT INTO Gtable (x, y, p) VALUES (40, 62, 34.356438);
INSERT INTO Gtable (x, y, p) VALUES (31, 9, 3.4538567);
INSERT INTO Gtable (x, y, p) VALUES (78, 78, 35.17351);
INSERT INTO Gtable (x, y, p) VALUES (92, 25, 39.30053);
INSERT INTO Gtable (x, y, p) VALUES (13, 20, 38.94938);
INSERT INTO Gtable (x, y, p) VALUES (15, 53, 7.2587996);
INSERT INTO Gtable (x, y, p) VALUES (88, 50, 15.651425);
INSERT INTO Gtable (x, y, p) VALUES (28, 85, 17.240036);
INSERT INTO Gtable (x, y, p) VALUES (20, 16, 9.660813);
INSERT INTO Gtable (x, y, p) VALUES (72, 37, 45.171566);
INSERT INTO Gtable (x, y, p) VALUES (3, 57, 3.4671247);
INSERT INTO Gtable (x, y, p) VALUES (79, 38, 15.748039);
INSERT INTO Gtable (x, y, p) VALUES (84, 35, 5.813277);
INSERT INTO Gtable (x, y, p) VALUES (49, 54, 9.425548);
INSERT INTO Gtable (x, y, p) VALUES (89, 19, 37.32113);
INSERT INTO Gtable (x, y, p) VALUES (9, 50, 43.713615);
INSERT INTO Gtable (x, y, p) VALUES (98, 66, 15.28742);
INSERT INTO Gtable (x, y, p) VALUES (98, 75, 41.686558);
INSERT INTO Gtable (x, y, p) VALUES (48, 57, 39.80088);
INSERT INTO Gtable (x, y, p) VALUES (68, 38, 31.844116);
INSERT INTO Gtable (x, y, p) VALUES (38, 19, 38.19786);
INSERT INTO Gtable (x, y, p) VALUES (54, 64, 34.211044);
INSERT INTO Gtable (x, y, p) VALUES (4, 66, 24.769905);
INSERT INTO Gtable (x, y, p) VALUES (83, 78, 10.838342);
INSERT INTO Gtable (x, y, p) VALUES (10, 61, 11.257985);
INSERT INTO Gtable (x, y, p) VALUES (30, 56, 33.942215);
INSERT INTO Gtable (x, y, p) VALUES (49, 6, 48.683334);
INSERT INTO Gtable (x, y, p) VALUES (29, 53, 36.64116);
INSERT INTO Gtable (x, y, p) VALUES (3, 44, 14.041596);
INSERT INTO Gtable (x, y, p) VALUES (31, 74, 46.633606);
INSERT INTO Gtable (x, y, p) VALUES (51, 92, 28.580782);
INSERT INTO Gtable (x, y, p) VALUES (17, 22, 36.448814);
INSERT INTO Gtable (x, y, p) VALUES (13, 82, 19.44243);
INSERT INTO Gtable (x, y, p) VALUES (84, 61, 2.243814);
INSERT INTO Gtable (x, y, p) VALUES (19, 12, 39.745785);
INSERT INTO Gtable (x, y, p) VALUES (39, 30, 8.257675);
INSERT INTO Gtable (x, y, p) VALUES (80, 9, 3.729579);
INSERT INTO Gtable (x, y, p) VALUES (10, 2, 21.560362);
INSERT INTO Gtable (x, y, p) VALUES (67, 10, 40.983112);
INSERT INTO Gtable (x, y, p) VALUES (20, 37, 7.702944);
INSERT INTO Gtable (x, y, p) VALUES (10, 18, 40.379223);
INSERT INTO Gtable (x, y, p) VALUES (38, 71, 3.6617012);
INSERT INTO Gtable (x, y, p) VALUES (54, 14, 39.37905);
INSERT INTO Gtable (x, y, p) VALUES (56, 65, 44.079548);
INSERT INTO Gtable (x, y, p) VALUES (91, 97, 26.731237);
INSERT INTO Gtable (x, y, p) VALUES (85, 46, 16.885025);
INSERT INTO Gtable (x, y, p) VALUES (93, 68, 26.472929);
INSERT INTO Gtable (x, y, p) VALUES (37, 46, 5.4799137);
INSERT INTO Gtable (x, y, p) VALUES (49, 95, 43.092495);
INSERT INTO Gtable (x, y, p) VALUES (75, 96, 13.49827);
INSERT INTO Gtable (x, y, p) VALUES (74, 92, 26.646852);
INSERT INTO Gtable (x, y, p) VALUES (49, 29, 3.471449);
INSERT INTO Gtable (x, y, p) VALUES (64, 29, 41.52457);
INSERT INTO Gtable (x, y, p) VALUES (30, 56, 12.435636);
INSERT INTO Gtable (x, y, p) VALUES (87, 11, 46.869007);
INSERT INTO Gtable (x, y, p) VALUES (28, 55, 35.56304);
INSERT INTO Gtable (x, y, p) VALUES (54, 78, 1.7691463);
INSERT INTO Gtable (x, y, p) VALUES (98, 11, 0.9991586);
INSERT INTO Gtable (x, y, p) VALUES (68, 42, 35.808186);
INSERT INTO Gtable (x, y, p) VALUES (14, 77, 38.610855);
INSERT INTO Gtable (x, y, p) VALUES (37, 91, 6.854719);
INSERT INTO Gtable (x, y, p) VALUES (37, 5, 37.19983);
INSERT INTO Gtable (x, y, p) VALUES (47, 28, 23.845179);
INSERT INTO Gtable (x, y, p) VALUES (15, 18, 5.369377);
INSERT INTO Gtable (x, y, p) VALUES (89, 44, 12.387649);
INSERT INTO Gtable (x, y, p) VALUES (73, 34, 39.850334);
INSERT INTO Gtable (x, y, p) VALUES (76, 39, 3.1816392);
INSERT INTO Gtable (x, y, p) VALUES (41, 53, 6.527853);
INSERT INTO Gtable (x, y, p) VALUES (89, 75, 4.571858);
INSERT INTO Gtable (x, y, p) VALUES (70, 60, 5.160302);
INSERT INTO Gtable (x, y, p) VALUES (85, 79, 16.59843);
INSERT INTO Gtable (x, y, p) VALUES (13, 90, 1.0524452);
INSERT INTO Gtable (x, y, p) VALUES (5, 81, 30.056324);
INSERT INTO Gtable (x, y, p) VALUES (27, 6, 41.55159);
INSERT INTO Gtable (x, y, p) VALUES (75, 11, 32.422348);
INSERT INTO Gtable (x, y, p) VALUES (64, 5, 42.592133);
INSERT INTO Gtable (x, y, p) VALUES (71, 65, 39.928345);
INSERT INTO Gtable (x, y, p) VALUES (53, 31, 19.925747);
INSERT INTO Gtable (x, y, p) VALUES (67, 81, 12.869063);
INSERT INTO Gtable (x, y, p) VALUES (17, 58, 40.55641);
INSERT INTO Gtable (x, y, p) VALUES (92, 1, 23.922369);
INSERT INTO Gtable (x, y, p) VALUES (2, 19, 4.4932785);
INSERT INTO Gtable (x, y, p) VALUES (49, 1, 9.557703);
INSERT INTO Gtable (x, y, p) VALUES (23, 11, 42.53429);
INSERT INTO Gtable (x, y, p) VALUES (19, 41, 34.28709);
INSERT INTO Gtable (x, y, p) VALUES (36, 78, 40.42251);
INSERT INTO Gtable (x, y, p) VALUES (35, 11, 38.02332);
INSERT INTO Gtable (x, y, p) VALUES (48, 91, 3.6394448);
INSERT INTO Gtable (x, y, p) VALUES (80, 22, 1.0538727);
INSERT INTO Gtable (x, y, p) VALUES (30, 68, 43.486977);
INSERT INTO Gtable (x, y, p) VALUES (50, 86, 17.34083);
INSERT INTO Gtable (x, y, p) VALUES (64, 75, 46.621696);




 -- 1 - 5 --> 9
INSERT INTO gtable (id, x, y, p) VALUES
(1, 1, 2, 7),
(2, 1, 3, 9),
(3, 1, 6, 14),
(4, 2, 3, 10),
(5, 2, 4, 15),
(6, 6, 3, 2),
(7, 4, 3, 11),
(8, 6, 5, 9),
(9, 4, 5, 6);


-- 1 - 19 --> 9
INSERT INTO gtable (id, x, y, p) VALUES
(1, 1, 2, 8),
(2, 2, 3, 6),
(3, 2, 4, 5),
(4, 2, 5, 5),
(5, 5, 7, 4),
(6, 8, 9, 3),
(7, 10, 11, 3),
(8, 5, 10, 5),
(9, 3, 10, 4),
(10, 9, 19, 2),
(11, 9, 11, 11),
(12, 3, 19, 6),
(13, 2, 10, 10),
(14, 9, 13, 5),
(15, 13, 15, 5),
(16, 15, 16, 5),
(17, 1, 6, 3),
(18, 6, 12, 8),
(19, 7, 14, 7),
(20, 2, 12, 8),
(21, 12, 16, 6),
(22, 8, 13, 7),
(23, 12, 8, 6),
(24, 13, 18, 10),
(25, 20, 17, 10),
(26, 17, 18, 12),
(27, 13, 17, 9),
(28, 16, 20, 11),
(29, 14, 20, 12),
(30, 4, 8, 6),
(31, 11, 19, 10),
(32, 19, 20, 14),
(33, 12, 14, 7),
(34, 1, 7, 8),
(35, 10, 9, 4),
(36, 18, 19, 6),
(37, 1, 21, 9),
(38, 21, 2, 10),
(39, 6, 10, 11),
(40, 15, 18, 14),
(41, 6, 15, 9);


-- 1 - 20 --> 9.00
INSERT INTO gtable (id, x, y, p) VALUES
(1, 1, 2, 8),
(2, 2, 3, 6),
(3, 2, 4, 5),
(4, 2, 5, 5),
(5, 5, 7, 4),
(6, 8, 9, 3),
(7, 10, 11, 3),
(8, 5, 10, 5),
(9, 3, 10, 4),
(10, 9, 19, 2),
(11, 9, 11, 11),
(12, 3, 19, 6),
(13, 2, 10, 10),
(14, 9, 13, 5),
(15, 13, 15, 5),
(16, 15, 16, 5),
(17, 1, 6, 3),
(18, 6, 12, 8),
(19, 7, 14, 7),
(20, 2, 12, 8),
(21, 12, 16, 6),
(22, 8, 13, 7),
(23, 12, 8, 6),
(24, 13, 18, 10),
(25, 20, 17, 10),
(26, 17, 18, 12),
(27, 13, 17, 9),
(28, 16, 20, 11),
(29, 14, 20, 12),
(30, 4, 8, 6),
(31, 11, 19, 10),
(32, 19, 20, 14),
(33, 12, 14, 7),
(34, 1, 7, 8),
(35, 10, 9, 4),
(36, 18, 19, 6),
(37, 1, 21, 9),
(38, 21, 2, 10),
(39, 6, 10, 11),
(40, 15, 18, 14),
(41, 6, 15, 9),
(42, 9, 18, 10);


-- 1 - 20 --> 15.00
INSERT INTO gtable (x, y, p) VALUES
(1, 2, 8),
(2, 3, 6),
(2, 4, 5),
(2, 5, 5),
(5, 7, 4),
(8, 9, 3),
(10, 11, 3),
(5, 10, 5),
(3, 10, 4),
( 9, 19, 2),
( 9, 11, 11),
( 3, 19, 6),
( 2, 10, 10),
( 9, 13, 5),
( 13, 15, 5),
( 15, 16, 5),
( 1, 6, 3),
( 6, 12, 8),
( 7, 14, 7),
( 2, 12, 8),
( 12, 16, 6),
( 8, 13, 7),
( 12, 8, 6),
( 13, 18, 10),
( 20, 17, 10),
( 17, 18, 12),
( 13, 17, 9),
( 16, 20, 11),
( 14, 20, 12),
( 4, 8, 6),
( 11, 19, 10),
( 19, 20, 14),
( 12, 14, 7),
( 1, 7, 8),
( 10, 9, 4),
( 18, 19, 6),
( 1, 21, 9),
( 21, 2, 10),
( 6, 10, 11),
( 15, 18, 14),
( 6, 15, 9),
( 9, 18, 10),
( 1, 14, 20),
( 14, 19, 20),
( 10, 19, 20),
( 8, 10, 20),
( 8, 15, 20),
( 12, 15, 20),
( 12, 21, 15),
( 20, 21, 20);
