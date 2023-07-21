-- Một công ty có một số nhân viên. Thuộc tính của nhân viên gồm có mã nhân viên , tên nhân viên, đia chỉ, ngày sinh. 
-- Hiện công ty thực hiện một vài dự án. Thông tin về dự án gồm có mã dự án , tên dự án và ngày bắt đầu. 
-- Một nhân viên có thể không tham gia hoặc tham gia một hay nhiều dự án. Một dự án phải có ít nhất một nhân viên. 
-- Tiền lương tham gia dự án của một nhân viên khác nhau theo từng dự án. 
--  Công ty cần lưu số tiền này cho mỗi nhân viên mỗi khi phân công nhân viên vào một dự án. 

create database company;
use company;
create table employee(
id int auto_increment primary key,
namePloyee varchar(200),
address varchar(255),
birth date
);

create table project(
id int auto_increment primary key,
nameProject varchar(255),
startDate date
);

create table employee_project(
id_employe int not null,
id_project int not null,
foreign key (id_employe) references employee(id),
foreign key (id_project) references project(id)
);

