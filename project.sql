create user 'admin'@'localhost' identified by '123';
grant all privileges on *.* to 'admin'@'localhost' with grant option;


create user 'dean'@'localhost' identified by '123';
grant all privileges on tech.* to 'dean'@'localhost';


create user 'lecturer'@'localhost' identified by '123';
grant select,update,delete,insert,drop on tech.* to 'lecturer'@'localhost';


create user 'inst'@'localhost' identified by '123';
grant select on tech.* to 'instructor'@'localhost';


create user 'techo'@'localhost' identified by '123';
grant select,insert,update on tech.* to 'techo'@'localhost';


create user 'student'@'localhost' identified by '123';
grant select on tech.* to 'student'@'localhost';

REVOKE permission ON database.table FROM 'user'@'localhost';  // remove privileges;

create database tech;


create table department
(d_id char(6),
d_name varchar(50),
d_lech_id char(6),
primary key(d_id)
);
ALTER TABLE department ADD FOREIGN KEY(d_lec_id) REFERENCES lecturer(lec_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into department
value
("dep001","Information & Communication Technology","lec001"),
("dep002","Engineering Technology","lec003");

************************************************************

create table student(
st_id varchar(6),
st_first_name varchar(15),
st_last_name varchar(15),
st_dep_id char(6),
st_city varchar (20),
st_dob date,
primary key(st_id));
ALTER TABLE student ADD FOREIGN KEY(st_dep_id)  REFERENCES department(d_id) on UPDATE CASCADE ON DELETE CASCADE; 


INSERT INTO student
value
("ICT001","A.M Sampath","sandaruwan","dep01","Ibbagamuwa",'1997-01-12'),
("ICT002","M.S Kalum","senarathna","dep01","Kamburupitiya",'1997-11-02'),
("ICT003","K.J. Kumara","perera","dep01","Matara",'1997-04-29'),
("ICT004","D.N. Lahiru","madusanka","dep01","Kaluthara",'1997-12-05'),
("ICT005","W.J. Nadun","tharindu","dep01","Panadura",'1997-01-20'),
("ICT006","R.S. sandun","perera","dep01","Akurassa",'1997-04-18'),
("ET007","K.N. malaka","isuru","dep02","Kandy",'1997-08-01'),
("ET008","A.V. Rasanjana","Supun","dep02","Anuradhapura",'1997-10-08'),
("ET009","K.M. Dewindi","Nimthara","dep02","Gall",'1997-07-17'),
("ET010","G.H. Ruwan","Lasantha","dep02","Gall",'1997-06-11');

*************************************************************************

create table subject(
sb_id varchar(6),
sb_name varchar(30),
sb_lec_id varchar(6),
sb_credit int,
primary key (sb_id));
ALTER TABLE subject ADD foreign key(sb_lec_id) references users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
alter  table subject add foreign key (dep_id) references department(d_id) On update cascade on delete cascade;

alter table subject add Theory_hours int;
alter table subject add Practical_hours int;

insert into subject
value
("ICT12","Database Mangment System","lec001",2),
("ICT14","C Program","lec002",1),
("ICT22","Computer Architecture","lec002",3),
("ICT13","Web Technology","lec001",2),
("ET12","Chemistry","lec003",2),
("ET11","Applied Calculus","lec004",3);


*******************************************************************************

create table st_sb
(st_id varchar(6),
sb_id varchar(6),
primary key(st_id,sb_id),
);
alter  table st_sb add foreign key (sb_id) references subject(sb_id) On update cascade on delete cascade;
ALTER TABLE st_sb ADD dep_id varchar(5);
alter  table st_sb add foreign key (dep_id) references department(d_id) On update cascade on delete cascade;

insert into st_sb
value
("ICT001","ICT12"),("ICT002","ICT12"),
("ICT001","ICT14"),("ICT002","ICT14"),
("ICT001","ICT22"),("ICT002","ICT22"),
("ICT001","ICT13"),("ICT002","ICT13"),
("ICT003","ICT12"),("ICT004","ICT12"),
("ICT003","ICT14"),("ICT004","ICT14"),
("ICT003","ICT22"),("ICT004","ICT22"),
("ICT003","ICT13"),("ICT004","ICT13"),
("ICT005","ICT12"),("ICT006","ICT12"),
("ICT005","ICT14"),("ICT006","ICT14"),
("ICT005","ICT22"),("ICT006","ICT22"),
("ICT005","ICT13"),("ICT006","ICT13"),
("ET007","ET12"),("ET008","ET12"),
("ET007","ET11"),("ET008","ET11"),
("ET009","ET12"),("ET010","ET12"),
("ET009","ET11"),("ET010","ET11")
;

UPDATE st_sb set dep_id ='dep01' WHERE st_id between 'ICT001' AND 'ICT006';
UPDATE st_sb set dep_id ='dep02' WHERE st_id between 'ET007' AND 'ET010';
*******************************************************************************

create table role
(role_id int AUTO_INCREMENT,
Description varchar(15),
isActive tinyint(1),
primary key(role_id)
);

insert into role
(Description,isActive)
value
("Admin",1),
("Dean",1),
("Lecturer",1),
("Instructor",1),
("Tech_officer",1),
("student",1);


*******************************************************************************

create table users(
user_id varchar(50),
u_fname varchar(30),
fk_role_id int,
password varchar(30),
isActive tinyint(1),
primary key (user_id),
foreign key (fk_role_id) references role(role_id));

INSERT INTO users
(user_id, u_fname, fk_role_id, email, password, isActive, imgpath, img)
 VALUES
('ICT006', 'S.L Sandeepa', 6, 'sandeepa@gmail.conm', '123', 1, '../uploads/', '16-japanese-girls-photo-wallpaper.jpg'),
('ICT005', 'K.S.Kalana', 6, 'kalana@gmail.com', '123', 1, '../uploads/', '[wallcoo_com]_little_girl_on_grass_ISPC006014.jpg'),
('ICT004', 'K.S.Malaka', 6, 'malaka@gmail.com', '123', 1, '../uploads/', '1_Edit_Child-Summer-Girl-Field-HD-Photo.jpg'),
('ICT002', 'K.M.L Sasanka', 6, 'sasanka@gmail.com', '123', 1, '../uploads/', '2017-12-24-13-03-47-210.jpg'),
('ICT003', 'H.D.Nimthara', 6, 'nimthara@gmail.com', '123', 1, '../uploads/', '[mrtelasm]-100-teen-vn-girls-wallpapers_www.bwalls.tk_-_026.jpg'),
('ICT001', 'A.K.L. Sasanka', 6, 'ranga@gmail.com', '123', 1, '../uploads/', '47591456-images-of-beautiful-girls.jpg'),
('admin', 'A.M.L Sampath', 1, 'lahirusampath8899@gmail.com', '1111', 1, '../uploads/', '20190120_072400.jpg'),
('ET007', 'G.Y.Isuru', 6, 'isyru@gmail.comn', '123', 1, '../uploads/', 'Baby-Eyes-Wallpaper-in-Free.jpg'),
('ET008', 'T.S Tharindu', 6, 'tharindu@gamil.com', '123', 1, '../uploads/', '19-japanese-girls-photo-wallpaper.jpg'),
('ET009', 'S.S. Akila', 6, 'akila@gmail.com', '123', 1, '../uploads/', '490138.jpg'),
('ET010', 'S.D.D Sandun', 6, 'sandun@gmail.com', '123', 1, '../uploads/', '322379-Asian-women-model.jpg'),
('lec001', 'A.A. Amarapala', 3, 'kumara@gmail.com', '1', 1, '../uploads/', 'model_3-wallpaper-2560x1440.jpg'),
('ET011', 'R.S. Kumara', 6, 'kumara@gmail.com', '123', 1, '../uploads/', ''),
('lec002', 'S.S. Ranathunga', 3, 'ranathunga@gmail.com', '123', 1, '../uploads/', '63.jpg'),
('lec003', 'H.S.S Hashini', 3, 'hasini@gmail.com', '123', 1, '../uploads/', 'girl-883007_1920.jpg'),
('lec004', 'A.B.C Chamal', 3, 'chamal@gmail.com', '123', 1, '../uploads/', '5j6a12041_9480749354_o.jpg');

*******************************************************************************

create table q_ict12
(st_id varchar(6),
Q1 int(2),
Q2 int(2), 
Q3 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into q_ict12
value
("ICT001",54,56,78),
("ICT002",84,16,45),
("ICT003",28,78,56),
("ICT004",71,28,39),
("ICT005",41,63,52),
("ICT006",73,82,19);

*************************************************************************

create table q_ict22
(st_id varchar(6),
Q1 int(2),
Q2 int(2), 
Q3 int(2),
Q4 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into q_ict22
value
("ICT001",89,15,78,56),
("ICT002",18,96,45,45),
("ICT003",28,58,37,46),
("ICT004",41,88,39,12),
("ICT005",64,43,52,56),
("ICT006",73,52,61,78);

*************************************************************************

create table q_ict13
(st_id varchar(6),
Q1 int(2),
Q2 int(2), 
Q3 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into q_ict13
value
("ICT001",15,68,78),
("ICT002",45,56,45),
("ICT003",89,58,45),
("ICT004",51,48,64),
("ICT005",34,97,55),
("ICT006",43,66,71);

********************************************************************

create table q_ict14
(st_id varchar(6),
Q1 int(2),
Q2 int(2), 
Q3 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into q_ict14
value
("ICT001",56,15,78),
("ICT002",18,14,45),
("ICT003",25,58,67),
("ICT004",51,68,39),
("ICT005",64,53,42),
("ICT006",63,52,41);

***************************************************************************


create table q_et11
(st_id varchar(6),
Q1 int(2),
Q2 int(2), 
Q3 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into q_et11
value
("ET007",89,28,56),
("ET008",31,45,79),
("ET009",47,45,46),
("ET010",29,96,72);

******************************************************************************

create table q_et12
(st_id varchar(6),
Q1 int(2),
Q2 int(2), 
Q3 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into q_et12
value
("ET007",54,28,56),
("ET008",31,64,79),
("ET009",97,54,46),
("ET010",19,89,72);

******************************************************************************

create table a_ict22
(st_id varchar(6),
A1 int(2), 
A2 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into a_ict22
value
("ICT001",56,15),
("ICT002",18,14),
("ICT003",25,67),
("ICT004",51,68),
("ICT005",53,42),
("ICT006",63,41);

***********************************************************************************
create table a_ict13
(st_id varchar(6),
A1 int(2),
A2 int(2), 
A3 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into a_ict13
value
("ICT001",56,15,78),
("ICT002",18,14,45),
("ICT003",25,58,67),
("ICT004",51,68,39),
("ICT005",64,53,42),
("ICT006",63,52,41);

******************************************************************************

create table a_ict12
(st_id varchar(6),
A1 int(2),
A2 int(2), 
A3 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into a_ict12
value
("ICT001",56,15,78),
("ICT002",18,14,45),
("ICT003",25,58,67),
("ICT004",51,68,39),
("ICT005",64,53,42),
("ICT006",63,52,41);

***********************************************************************************

create table a_et11
(st_id varchar(6),
A1 int(2),
A2 int(2), 
A3 int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into a_et11
value
("ET007",54,28,56),
("ET008",31,64,79),
("ET009",97,54,46),
("ET010",19,89,72);

**********************************************************************************

create table m_ict22
(st_id varchar(6),
m_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into m_ict22
value
("ICT001",56),
("ICT002",18),
("ICT003",67),
("ICT004",51),
("ICT005",64),
("ICT006",41);

**********************************************************************************

create table m_ict14
(st_id varchar(6),
m_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into m_ict14
value
("ICT001",78),
("ICT002",56),
("ICT003",36),
("ICT004",89),
("ICT005",14),
("ICT006",65);

**********************************************************************************

create table m_et12
(st_id varchar(6),
m_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into m_et12
value
("ET007",54),
("ET008",79),
("ET009",46),
("ET010",72);

*******************************************************************************

create table final_t_ict12
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_t_ict12
value
("ICT001",78),
("ICT002",56),
("ICT003",36),
("ICT004",89),
("ICT005",14),
("ICT006",65);

*******************************************************************************

create table final_t_ict22
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_t_ict22
value
("ICT001",58),
("ICT002",56),
("ICT003",47),
("ICT004",67),
("ICT005",47),
("ICT006",58);

*******************************************************************************

create table final_t_ict14
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_t_ict14
value
("ICT001",78),
("ICT002",56),
("ICT003",58),
("ICT004",67),
("ICT005",66),
("ICT006",58);

*******************************************************************************

create table final_t_ict13
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_t_ict13
value
("ICT001",88),
("ICT002",56),
("ICT003",78),
("ICT004",66),
("ICT005",76),
("ICT006",59);

*******************************************************************************

create table final_t_et12
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_t_et12
value
("ET007",56),
("ET008",79),
("ET009",46),
("ET010",72);

*******************************************************************************

create table final_t_et11
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_t_et11
value
("ET007",76),
("ET008",75),
("ET009",48),
("ET010",42);

*******************************************************************************

create table final_p_ict12
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_p_ict12
value
("ICT001",78),
("ICT002",56),
("ICT003",36),
("ICT004",89),
("ICT005",14),
("ICT006",65);

*******************************************************************************

create table final_p_ict14
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_p_ict14
value
("ICT001",48),
("ICT002",76),
("ICT003",37),
("ICT004",19),
("ICT005",45),
("ICT006",85);

*******************************************************************************

create table final_p_ict13
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_p_ict13
value
("ICT001",48),
("ICT002",76),
("ICT003",37),
("ICT004",19),
("ICT005",45),
("ICT006",85);

*******************************************************************************

create table final_p_et12
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_p_et12
value
("ET007",76),
("ET008",75),
("ET009",48),
("ET010",42);

*******************************************************************************

create table final_p_et11
(st_id varchar(6),
f_mark int(2),
primary key(st_id),
foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE);

insert into final_p_et11
value
("ET007",76),
("ET008",45),
("ET009",58),
("ET010",48);

*******************************************************************************

create table att_t_ict22
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_t_ict22 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_t_ict22
(st_id,Dates,stat,medi)
value
(1, 'ICT001', '2019-01-24', 0, 0),
(2, 'ICT001', '2019-02-12', 0, 0),
(3, 'ICT001', '2019-02-17', 1, 0),
(4, 'ICT001', '2019-02-18', 0, 0),
(5, 'ICT001', '2019-02-19', 1, 0),
(6, 'ICT001', '2019-02-20', 1, 0),
(7, 'ICT001', '2019-02-21', 1, 0),
(8, 'ICT001', '2019-02-22', 0, 1),
(9, 'ICT001', '2019-02-23', 0, 1),
(10, 'ICT001', '2019-02-24', 1, 0),
(11, 'ICT001', '2019-02-25', 1, 0),
(12, 'ICT001', '2019-02-26', 0, 1),
(13, 'ICT001', '2019-02-27', 1, 0),
(14, 'ICT001', '2019-02-28', 0, 0),
(15, 'ICT001', '2019-03-01', 1, 0),
(16, 'ICT002', '2019-02-15', 1, 0),
(17, 'ICT002', '2019-02-16', 0, 1),
(18, 'ICT002', '2019-02-17', 1, 0),
(19, 'ICT002', '2019-02-18', 0, 1),
(20, 'ICT002', '2019-02-19', 0, 1),
(21, 'ICT002', '2019-02-20', 1, 0),
(22, 'ICT002', '2019-02-21', 1, 0),
(23, 'ICT002', '2019-02-22', 0, 1),
(24, 'ICT002', '2019-02-23', 1, 0),
(25, 'ICT002', '2019-02-24', 1, 0),
(26, 'ICT002', '2019-02-25', 1, 0),
(27, 'ICT002', '2019-02-26', 0, 1),
(28, 'ICT002', '2019-02-27', 1, 0),
(29, 'ICT002', '2019-02-28', 1, 0),
(30, 'ICT002', '2019-03-01', 0, 0),
(31, 'ICT003', '2019-02-15', 1, 0),
(32, 'ICT003', '2019-02-16', 0, 1),
(33, 'ICT003', '2019-02-17', 0, 0),
(34, 'ICT003', '2019-02-18', 0, 1),
(35, 'ICT003', '2019-02-19', 0, 1),
(36, 'ICT003', '2019-02-20', 1, 0),
(37, 'ICT003', '2019-02-21', 0, 0),
(38, 'ICT003', '2019-02-22', 0, 1),
(39, 'ICT003', '2019-02-23', 1, 0),
(40, 'ICT003', '2019-02-24', 1, 0),
(41, 'ICT003', '2019-02-25', 0, 0),
(42, 'ICT003', '2019-02-26', 0, 1),
(43, 'ICT003', '2019-02-27', 1, 0),
(44, 'ICT003', '2019-02-28', 1, 0),
(45, 'ICT003', '2019-03-01', 1, 0),
(46, 'ICT004', '2019-02-15', 1, 0),
(47, 'ICT004', '2019-02-16', 0, 1),
(48, 'ICT004', '2019-02-17', 1, 0),
(49, 'ICT004', '2019-02-18', 0, 1),
(50, 'ICT004', '2019-02-19', 0, 1),
(51, 'ICT004', '2019-02-20', 1, 0),
(52, 'ICT004', '2019-02-21', 1, 0),
(53, 'ICT004', '2019-02-22', 0, 1),
(54, 'ICT004', '2019-02-23', 1, 0),
(55, 'ICT004', '2019-02-24', 1, 0),
(56, 'ICT004', '2019-02-25', 1, 0),
(57, 'ICT004', '2019-02-26', 1, 0),
(58, 'ICT004', '2019-02-27', 1, 0),
(59, 'ICT004', '2019-02-28', 1, 0),
(60, 'ICT004', '2019-03-01', 1, 0),
(61, 'ICT005', '2019-02-15', 1, 0),
(62, 'ICT005', '2019-02-16', 0, 1),
(63, 'ICT005', '2019-02-17', 1, 0),
(64, 'ICT005', '2019-02-18', 0, 1),
(65, 'ICT005', '2019-02-19', 0, 1),
(66, 'ICT005', '2019-02-20', 1, 0),
(67, 'ICT005', '2019-02-21', 1, 0),
(68, 'ICT005', '2019-02-22', 0, 1),
(69, 'ICT005', '2019-02-23', 1, 0),
(70, 'ICT005', '2019-02-24', 1, 0),
(71, 'ICT005', '2019-02-25', 1, 0),
(72, 'ICT005', '2019-02-26', 0, 1),
(73, 'ICT005', '2019-02-27', 1, 0),
(74, 'ICT005', '2019-02-28', 1, 0),
(75, 'ICT005', '2019-03-01', 0, 0),
(76, 'ICT006', '2019-02-15', 1, 0),
(77, 'ICT006', '2019-02-16', 0, 1),
(78, 'ICT006', '2019-02-17', 1, 0),
(79, 'ICT006', '2019-02-18', 0, 1),
(80, 'ICT006', '2019-02-19', 0, 1),
(81, 'ICT006', '2019-02-20', 1, 0),
(82, 'ICT006', '2019-02-21', 1, 0),
(83, 'ICT006', '2019-02-22', 0, 1),
(84, 'ICT006', '2019-02-23', 1, 0),
(85, 'ICT006', '2019-02-24', 1, 0),
(86, 'ICT006', '2019-02-25', 1, 0),
(87, 'ICT006', '2019-02-26', 0, 1),
(88, 'ICT006', '2019-02-27', 1, 0),
(89, 'ICT006', '2019-02-28', 1, 0),
(90, 'ICT006', '2019-03-01', 0, 0);

*******************************************************************************

create table att_t_ict12
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_t_ict12 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_t_ict12
(st_id,Dates,stat,medi)
value
('ICT001', '2019-01-24', 0, 0),
('ICT001', '2019-02-12', 0, 0),
('ICT001', '2019-02-17', 1, 0),
('ICT001', '2019-02-18', 0, 0),
('ICT001', '2019-02-19', 1, 0),
('ICT001', '2019-02-20', 1, 0),
('ICT001', '2019-02-21', 1, 0),
('ICT001', '2019-02-22', 0, 1),
('ICT001', '2019-02-23', 0, 1),
('ICT002', '2019-02-15', 1, 0),
('ICT002', '2019-02-16', 0, 1),
('ICT002', '2019-02-17', 1, 0),
('ICT002', '2019-02-18', 0, 1),
('ICT002', '2019-02-19', 0, 1),
('ICT002', '2019-02-20', 1, 0),
('ICT002', '2019-02-21', 1, 0),
('ICT002', '2019-02-22', 0, 1),
('ICT002', '2019-02-23', 1, 0),
('ICT003', '2019-02-15', 1, 0),
('ICT003', '2019-02-16', 0, 1),
('ICT003', '2019-02-17', 0, 0),
('ICT003', '2019-02-18', 0, 1),
('ICT003', '2019-02-19', 0, 1),
('ICT003', '2019-02-20', 1, 0),
('ICT003', '2019-02-21', 0, 0),
('ICT003', '2019-02-22', 0, 1),
('ICT003', '2019-02-23', 1, 0),
('ICT004', '2019-02-15', 1, 0),
('ICT004', '2019-02-16', 0, 1),
('ICT004', '2019-02-17', 1, 0),
('ICT004', '2019-02-18', 0, 1),
('ICT004', '2019-02-19', 0, 1),
('ICT004', '2019-02-20', 1, 0),
('ICT004', '2019-02-21', 1, 0),
('ICT004', '2019-02-22', 0, 1),
('ICT004', '2019-02-23', 1, 0),
('ICT005', '2019-02-15', 1, 0),
('ICT005', '2019-02-16', 0, 1),
('ICT005', '2019-02-17', 1, 0),
('ICT005', '2019-02-18', 0, 1),
('ICT005', '2019-02-19', 0, 1),
('ICT005', '2019-02-20', 1, 0),
('ICT005', '2019-02-21', 1, 0),
('ICT005', '2019-02-22', 0, 1),
('ICT005', '2019-02-23', 1, 0),
('ICT006', '2019-02-15', 1, 0),
('ICT006', '2019-02-16', 0, 1),
('ICT006', '2019-02-17', 1, 0),
('ICT006', '2019-02-18', 0, 1),
('ICT006', '2019-02-19', 0, 1),
('ICT006', '2019-02-20', 1, 0),
('ICT006', '2019-02-21', 1, 0),
('ICT006', '2019-02-22', 0, 1),
('ICT006', '2019-02-23', 1, 0);


*************************************************************************************

create table att_p_ict12
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_p_ict12 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;


insert into att_p_ict12
(st_id,Dates,stat,medi)
value
('ICT001', '2019-01-31', 0, 0),
('ICT001', '2019-02-02', 0, 0),
('ICT001', '2019-02-05', 1, 0),
('ICT001', '2019-02-09', 0, 0),
('ICT001', '2019-02-12', 1, 0),
('ICT001', '2019-02-13', 1, 0),
('ICT002', '2019-01-31', 0, 1),
('ICT002', '2019-02-02', 0, 1),
('ICT002', '2019-02-20', 1, 0),
('ICT002', '2019-02-21', 1, 0),
('ICT002', '2019-02-22', 0, 1),
('ICT002', '2019-02-23', 1, 0),
('ICT003', '2019-01-31', 0, 0),
('ICT003', '2019-02-02', 0, 1),
('ICT003', '2019-02-05', 0, 1),
('ICT003', '2019-02-09', 0, 1),
('ICT003', '2019-02-12', 0, 1),
('ICT003', '2019-02-13', 1, 0),
('ICT004', '2019-01-31', 0, 1),
('ICT004', '2019-02-02', 0, 1),
('ICT004', '2019-02-05', 1, 0),
('ICT004', '2019-02-09', 1, 0),
('ICT004', '2019-02-12', 0, 1),
('ICT004', '2019-02-13', 1, 0),
('ICT005', '2019-01-31', 0, 1),
('ICT005', '2019-02-02', 0, 1),
('ICT005', '2019-02-05', 1, 0),
('ICT005', '2019-02-09', 1, 0),
('ICT005', '2019-02-12', 0, 1),
('ICT005', '2019-02-13', 1, 0),
('ICT006', '2019-01-31', 0, 1),
('ICT006', '2019-02-02', 0, 1),
('ICT006', '2019-02-05', 1, 0),
('ICT006', '2019-02-09', 1, 0),
('ICT006', '2019-02-12', 0, 1),
('ICT006', '2019-02-13', 1, 0);

*******************************************************************************

create table att_t_ict14
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_t_ict14 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_t_ict14
(st_id,Dates,stat,medi)
value
('ICT001', '2019-01-24', 1, 0),
('ICT001', '2019-02-12', 0, 0),
('ICT001', '2019-02-17', 0, 0),
('ICT001', '2019-02-18', 0, 0),
('ICT001', '2019-02-19', 1, 0),
('ICT001', '2019-02-20', 1, 0),
('ICT001', '2019-02-21', 1, 0),
('ICT001', '2019-02-22', 0, 1),
('ICT001', '2019-02-23', 0, 1),
('ICT002', '2019-01-24', 1, 0),
('ICT002', '2019-02-12', 0, 1),
('ICT002', '2019-02-17', 0, 0),
('ICT002', '2019-02-18', 1, 1),
('ICT002', '2019-02-19', 0, 1),
('ICT002', '2019-02-20', 1, 0),
('ICT002', '2019-02-21', 1, 0),
('ICT002', '2019-02-22', 0, 1),
('ICT002', '2019-02-23', 1, 0),
('ICT003', '2019-01-24', 1, 0),
('ICT003', '2019-02-12', 0, 1),
('ICT003', '2019-02-17', 0, 0),
('ICT003', '2019-02-18', 1, 1),
('ICT003', '2019-02-19', 0, 1),
('ICT003', '2019-02-20', 1, 0),
('ICT003', '2019-02-21', 0, 0),
('ICT003', '2019-02-22', 0, 1),
('ICT003', '2019-02-23', 1, 0),
('ICT004', '2019-01-24', 1, 0),
('ICT004', '2019-02-12', 0, 1),
('ICT004', '2019-02-17', 1, 0),
('ICT004', '2019-02-18', 1, 1),
('ICT004', '2019-02-19', 0, 1),
('ICT004', '2019-02-20', 1, 0),
('ICT004', '2019-02-21', 1, 0),
('ICT004', '2019-02-22', 0, 1),
('ICT004', '2019-02-23', 1, 0),
('ICT005', '2019-01-24', 1, 0),
('ICT005', '2019-02-12', 0, 1),
('ICT005', '2019-02-17', 1, 0),
('ICT005', '2019-02-18', 1, 1),
('ICT005', '2019-02-19', 0, 1),
('ICT005', '2019-02-20', 1, 0),
('ICT005', '2019-02-21', 1, 0),
('ICT005', '2019-02-22', 0, 1),
('ICT005', '2019-02-23', 1, 0),
('ICT006', '2019-01-24', 1, 0),
('ICT006', '2019-02-12', 0, 1),
('ICT006', '2019-02-17', 1, 0),
('ICT006', '2019-02-18', 0, 1),
('ICT006', '2019-02-19', 0, 1),
('ICT006', '2019-02-20', 1, 0),
('ICT006', '2019-02-21', 1, 0),
('ICT006', '2019-02-22', 0, 1),
('ICT006', '2019-02-23', 1, 0);

*******************************************************************************

create table att_p_ict14
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_p_ict14 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_p_ict14
(st_id,Dates,stat,medi)
value
('ICT001', '2019-01-31', 0, 0),
('ICT001', '2019-02-02', 0, 0),
('ICT001', '2019-02-05', 1, 0),
('ICT001', '2019-02-09', 0, 0),
('ICT001', '2019-02-12', 1, 0),
('ICT001', '2019-02-13', 1, 0),
('ICT002', '2019-01-31', 0, 1),
('ICT002', '2019-02-02', 0, 1),
('ICT002', '2019-02-20', 1, 0),
('ICT002', '2019-02-21', 1, 0),
('ICT002', '2019-02-22', 0, 1),
('ICT002', '2019-02-23', 1, 0),
('ICT003', '2019-01-31', 1, 0),
('ICT003', '2019-02-02', 1, 1),
('ICT003', '2019-02-05', 1, 1),
('ICT003', '2019-02-09', 0, 1),
('ICT003', '2019-02-12', 0, 1),
('ICT003', '2019-02-13', 1, 0),
('ICT004', '2019-01-31', 0, 1),
('ICT004', '2019-02-02', 0, 1),
('ICT004', '2019-02-05', 1, 0),
('ICT004', '2019-02-09', 1, 0),
('ICT004', '2019-02-12', 0, 1),
('ICT004', '2019-02-13', 1, 0),
('ICT005', '2019-01-31', 1, 1),
('ICT005', '2019-02-02', 0, 1),
('ICT005', '2019-02-05', 1, 0),
('ICT005', '2019-02-09', 1, 0),
('ICT005', '2019-02-12', 0, 1),
('ICT005', '2019-02-13', 0, 0),
('ICT006', '2019-01-31', 0, 1),
('ICT006', '2019-02-02', 0, 1),
('ICT006', '2019-02-05', 1, 0),
('ICT006', '2019-02-09', 1, 0),
('ICT006', '2019-02-12', 0, 1),
('ICT006', '2019-02-13', 0, 0);

*******************************************************************************

create table att_t_ict13
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_t_ict13 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_t_ict13
(st_id,Dates,stat,medi)
value
('ICT001', '2019-01-24', 1, 0),
('ICT001', '2019-02-12', 0, 0),
('ICT001', '2019-02-17', 0, 0),
('ICT001', '2019-02-18', 1, 0),
('ICT001', '2019-02-19', 1, 0),
('ICT001', '2019-02-20', 1, 0),
('ICT001', '2019-02-21', 1, 0),
('ICT001', '2019-02-22', 0, 1),
('ICT001', '2019-02-23', 0, 1),
('ICT002', '2019-01-24', 1, 0),
('ICT002', '2019-02-12', 0, 1),
('ICT002', '2019-02-17', 0, 0),
('ICT002', '2019-02-18', 1, 1),
('ICT002', '2019-02-19', 0, 1),
('ICT002', '2019-02-20', 1, 0),
('ICT002', '2019-02-21', 1, 0),
('ICT002', '2019-02-22', 1, 1),
('ICT002', '2019-02-23', 1, 0),
('ICT003', '2019-01-24', 1, 0),
('ICT003', '2019-02-12', 0, 1),
('ICT003', '2019-02-17', 0, 0),
('ICT003', '2019-02-18', 1, 1),
('ICT003', '2019-02-19', 0, 1),
('ICT003', '2019-02-20', 1, 0),
('ICT003', '2019-02-21', 0, 0),
('ICT003', '2019-02-22', 0, 1),
('ICT003', '2019-02-23', 1, 0),
('ICT004', '2019-01-24', 1, 0),
('ICT004', '2019-02-12', 0, 1),
('ICT004', '2019-02-17', 1, 0),
('ICT004', '2019-02-18', 1, 1),
('ICT004', '2019-02-19', 1, 1),
('ICT004', '2019-02-20', 1, 0),
('ICT004', '2019-02-21', 1, 0),
('ICT004', '2019-02-22', 0, 1),
('ICT004', '2019-02-23', 1, 0),
('ICT005', '2019-01-24', 1, 0),
('ICT005', '2019-02-12', 0, 1),
('ICT005', '2019-02-17', 1, 0),
('ICT005', '2019-02-18', 1, 1),
('ICT005', '2019-02-19', 0, 1),
('ICT005', '2019-02-20', 1, 0),
('ICT005', '2019-02-21', 1, 0),
('ICT005', '2019-02-22', 0, 1),
('ICT005', '2019-02-23', 1, 0),
('ICT006', '2019-01-24', 1, 0),
('ICT006', '2019-02-12', 0, 1),
('ICT006', '2019-02-17', 1, 0),
('ICT006', '2019-02-18', 0, 1),
('ICT006', '2019-02-19', 0, 1),
('ICT006', '2019-02-20', 0, 0),
('ICT006', '2019-02-21', 1, 0),
('ICT006', '2019-02-22', 0, 1),
('ICT006', '2019-02-23', 1, 0);

*******************************************************************************

create table att_p_ict13
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date),
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_p_ict13 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_p_ict13
(st_id,Dates,stat,medi)
value
('ICT001', '2019-02-01', 0, 0),
('ICT001', '2019-02-03', 0, 0),
('ICT001', '2019-02-06', 1, 0),
('ICT001', '2019-02-08', 0, 0),
('ICT001', '2019-02-11', 1, 0),
('ICT001', '2019-02-15', 1, 0),
('ICT002', '2019-02-01', 0, 1),
('ICT002', '2019-02-03', 0, 1),
('ICT002', '2019-02-26', 1, 0),
('ICT002', '2019-02-28', 1, 0),
('ICT002', '2019-02-21', 0, 1),
('ICT002', '2019-02-25', 1, 0),
('ICT003', '2019-02-01', 1, 0),
('ICT003', '2019-02-03', 1, 1),
('ICT003', '2019-02-06', 1, 1),
('ICT003', '2019-02-08', 0, 1),
('ICT003', '2019-02-11', 0, 1),
('ICT003', '2019-02-15', 1, 0),
('ICT004', '2019-02-01', 0, 1),
('ICT004', '2019-02-03', 0, 1),
('ICT004', '2019-02-06', 1, 0),
('ICT004', '2019-02-08', 1, 0),
('ICT004', '2019-02-11', 0, 1),
('ICT004', '2019-02-15', 1, 0),
('ICT005', '2019-02-01', 1, 1),
('ICT005', '2019-02-03', 0, 1),
('ICT005', '2019-02-06', 1, 0),
('ICT005', '2019-02-08', 1, 0),
('ICT005', '2019-02-11', 0, 1),
('ICT005', '2019-02-15', 0, 0),
('ICT006', '2019-02-01', 0, 1),
('ICT006', '2019-02-03', 0, 1),
('ICT006', '2019-02-06', 1, 0),
('ICT006', '2019-02-08', 1, 0),
('ICT006', '2019-02-11', 0, 1),
('ICT006', '2019-02-15', 0, 0);

*******************************************************************************

create table  att_m_ict14
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_m_ict14 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_m_ict14
(st_id,Dates,stat,medi)
value
('ICT001', '2019-02-01', 0, 1),
('ICT002', '2019-02-03', 0, 1),
('ICT003', '2019-02-06', 1, 0),
('ICT004', '2019-02-08', 1, 0),
('ICT005', '2019-02-11', 0, 1),
('ICT006', '2019-02-15', 0, 0);
;

*******************************************************************************

create table att_m_ict22
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_m_ict22 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_m_ict22
(st_id,Dates,stat,medi)
value
('ICT001', '2019-02-01', 0, 1),
('ICT002', '2019-02-03', 0, 1),
('ICT003', '2019-02-06', 1, 0),
('ICT004', '2019-02-08', 1, 0),
('ICT005', '2019-02-11', 0, 1),
('ICT006', '2019-02-15', 0, 0);
;

*******************************************************************************


create table att_t_et11
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_t_et11 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_t_et11
(st_id,Dates,stat,medi)
value
('ET007', '2019-02-05', 1, 0),
('ET007', '2019-02-07', 1, 0),
('ET007', '2019-02-09', 1, 0),
('ET007', '2019-02-10', 1, 0),
('ET007', '2019-02-15', 1, 0),
('ET007', '2019-02-14', 0, 0),
('ET007', '2019-02-13', 1, 0),
('ET007', '2019-02-12', 1, 0),
('ET007', '2019-02-16', 0, 0),
('ET008', '2019-02-17', 1, 0),
('ET008', '2019-02-18', 0, 1),
('ET008', '2019-02-09', 0, 0),
('ET008', '2019-02-10', 0, 1),
('ET008', '2019-02-15', 0, 1),
('ET008', '2019-02-14', 1, 0),
('ET008', '2019-02-13', 1, 0),
('ET008', '2019-02-12', 0, 1),
('ET008', '2019-02-16', 1, 0),
('ET009', '2019-02-17', 1, 0),
('ET009', '2019-02-18', 1, 0),
('ET009', '2019-02-09', 1, 0),
('ET009', '2019-02-10', 0, 1),
('ET009', '2019-02-15', 0, 1),
('ET009', '2019-02-14', 1, 0),
('ET009', '2019-02-13', 1, 0),
('ET009', '2019-02-12', 0, 1),
('ET009', '2019-02-16', 1, 0),
('ET010', '2019-02-17', 1, 0),
('ET010', '2019-02-18', 0, 1),
('ET010', '2019-02-09', 1, 0),
('ET010', '2019-02-10', 0, 1),
('ET010', '2019-02-15', 0, 0),
('ET010', '2019-02-14', 0, 0),
('ET010', '2019-02-13', 1, 0),
('ET010', '2019-02-12', 1, 0),
('ET010', '2019-02-16', 1, 0),
('ET010', '2019-02-17', 0, 1),
('ET010', '2019-02-18', 1, 0);

**********************************************************************************************

create table att_p_et11
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates  date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_p_et11 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_p_et11
(st_id,Dates,stat,medi)
value
('ET007', '2019-02-08', 1, 0),
('ET007', '2019-02-12', 1, 0),
('ET007', '2019-02-13', 1, 0),
('ET007', '2019-02-18', 1, 0),
('ET007', '2019-02-19', 1, 0),
('ET007', '2019-02-20', 0, 0),
('ET008', '2019-02-08', 1, 0),
('ET008', '2019-02-12', 0, 1),
('ET008', '2019-02-13', 0, 0),
('ET008', '2019-02-18', 0, 1),
('ET008', '2019-02-19', 0, 1),
('ET008', '2019-02-20', 1, 0),
('ET009', '2019-02-08', 1, 0),
('ET009', '2019-02-12', 1, 0),
('ET009', '2019-02-13', 1, 0),
('ET009', '2019-02-18', 0, 1),
('ET009', '2019-02-19', 0, 1),
('ET009', '2019-02-20', 1, 0),
('ET010', '2019-02-08', 1, 0),
('ET010', '2019-02-12', 0, 1),
('ET010', '2019-02-13', 1, 0),
('ET010', '2019-02-18', 0, 1),
('ET010', '2019-02-19', 0, 0),
('ET010', '2019-02-20', 0, 0);

*******************************************************************************

create table att_t_et12
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates  date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_t_et12 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_t_et12
(st_id,Dates,stat,medi)
value
('ET007', '2019-02-05', 1, 0),
('ET007', '2019-02-07', 1, 0),
('ET007', '2019-02-09', 1, 0),
('ET007', '2019-02-10', 1, 0),
('ET007', '2019-02-15', 1, 0),
('ET007', '2019-02-14', 0, 0),
('ET007', '2019-02-13', 1, 0),
('ET007', '2019-02-12', 1, 0),
('ET007', '2019-02-16', 0, 0),
('ET008', '2019-02-17', 1, 0),
('ET008', '2019-02-18', 0, 1),
('ET008', '2019-02-09', 0, 0),
('ET008', '2019-02-10', 0, 1),
('ET008', '2019-02-15', 1, 1),
('ET008', '2019-02-14', 0, 0),
('ET008', '2019-02-13', 0, 0),
('ET008', '2019-02-12', 0, 1),
('ET008', '2019-02-16', 1, 0),
('ET009', '2019-02-17', 0, 0),
('ET009', '2019-02-18', 1, 0),
('ET009', '2019-02-09', 1, 0),
('ET009', '2019-02-10', 0, 1),
('ET009', '2019-02-15', 1, 1),
('ET009', '2019-02-14', 1, 0),
('ET009', '2019-02-13', 1, 0),
('ET009', '2019-02-12', 1, 1),
('ET009', '2019-02-16', 1, 0),
('ET010', '2019-02-17', 1, 0),
('ET010', '2019-02-18', 0, 1),
('ET010', '2019-02-09', 1, 0),
('ET010', '2019-02-10', 0, 1),
('ET010', '2019-02-15', 1, 0),
('ET010', '2019-02-14', 0, 0),
('ET010', '2019-02-13', 1, 0),
('ET010', '2019-02-12', 1, 0),
('ET010', '2019-02-16', 1, 0),
('ET010', '2019-02-17', 0, 1),
('ET010', '2019-02-18', 1, 0);


*******************************************************************************

create table att_m_et12
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_m_et12 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_m_et12
(st_id,Dates,stat,medi)
value
('ICT001', '2019-02-01', 0, 1),
('ICT002', '2019-02-03', 0, 1),
('ICT003', '2019-02-06', 1, 0),
('ICT004', '2019-02-08', 1, 0),
('ICT005', '2019-02-11', 0, 1),
('ICT006', '2019-02-15', 0, 0);


**********************************************************************************************

create table att_p_et12
(att_id INT AUTO_INCREMENT,
st_id varchar(6),
Dates  date,
stat int(1),
medi int(1),
primary key(att_id));
Alter table att_p_et12 add foreign key(st_id) references student(st_id) ON UPDATE CASCADE ON DELETE CASCADE;

insert into att_p_et12
(st_id,Dates,stat,medi)
value
('ET007', '2019-02-10', 1, 0),
('ET007', '2019-02-12', 1, 0),
('ET007', '2019-02-15', 1, 0),
('ET007', '2019-02-18', 1, 0),
('ET007', '2019-02-22', 1, 0),
('ET007', '2019-02-20', 0, 0),
('ET008', '2019-02-10', 1, 0),
('ET008', '2019-02-12', 0, 1),
('ET008', '2019-02-15', 0, 0),
('ET008', '2019-02-18', 0, 1),
('ET008', '2019-02-22', 0, 1),
('ET008', '2019-02-20', 1, 0),
('ET009', '2019-02-10', 1, 0),
('ET009', '2019-02-12', 1, 0),
('ET009', '2019-02-15', 1, 0),
('ET009', '2019-02-18', 0, 1),
('ET009', '2019-02-22', 0, 1),
('ET009', '2019-02-20', 1, 0),
('ET010', '2019-02-10', 1, 0),
('ET010', '2019-02-12', 0, 1),
('ET010', '2019-02-15', 1, 0),
('ET010', '2019-02-18', 0, 1),
('ET010', '2019-02-22', 0, 0),
('ET010', '2019-02-20', 0, 0);

**********************************************************************************************

**********************************************************************************************

 select st_id,sum(stat),sum(medi),sum((stat+medi)/15)*100 from att_m_et12 group by st_id;

**********************************************************************************************
**********************************************************************************************
