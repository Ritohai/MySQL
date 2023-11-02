DROP DATABASE IF exists QuanLySinhVien;
CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;

CREATE TABLE Class (
    ClassID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ClassName VARCHAR(60) NOT NULL,
    StartDate DATETIME NOT NULL,
    Status BIT
);
CREATE TABLE Student (
    StudentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    Address VARCHAR(50),
    Phone VARCHAR(20),
    Status BIT,
    ClassId INT NOT NULL,
    FOREIGN KEY (ClassId)
        REFERENCES Class (ClassID)
);
CREATE TABLE Subject (
    SubId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubName VARCHAR(30) NOT NULL,
    Credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    Status BIT DEFAULT 1
);
CREATE TABLE Mark (
    MarkId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    SubId INT NOT NULL,
    StudentId INT NOT NULL,
    Mark FLOAT DEFAULT 0 CHECK (Mark BETWEEN 0 AND 100),
    ExamTimes TINYINT DEFAULT 1,
    UNIQUE (SubId , StudentId),
    FOREIGN KEY (SubId)
        REFERENCES Subject (SubId),
    FOREIGN KEY (StudentId)
        REFERENCES Student (StudentId)
);
insert into Class Values(1,'A1','2008-12-20',1);
insert into Class Values(2,'A2','2008-12-22',1);
insert into Class Values(3,'B3',current_date(),0);

insert into Student (StudentName,Address,Phone,Status,ClassId) values('Hung','Ha nam','0989665048',1,1);
insert into Student (StudentName,Address,Phone,Status,ClassId) values('Hoa','Hai phong','0989665058',1,1);
insert into Student (StudentName,Address,Phone,Status,ClassId) values('Manh','Ha noi','0837282598',0,2);

insert into Subject values(1,'CF',5,1),(2,'C',6,1),(3,'HDJ',5,1),(4,'RDBMS',10,1);

INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
-- • Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject
where credit = (select max(credit) from subject);

-- • Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject
left join mark m on m.subId = subject.subId
where mark = (select max(mark) from mark);

-- • Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select Student.StudentId,StudentName,Address,Phone,Status,ClassId, avg(mark.mark) as 'Điểm trung bình' from  Student
join mark on mark.studentId = Student.studentId
group by StudentId,StudentName,Address,Phone,Status,ClassId
order by avg(mark.mark) desc;




