create database ss6;
use ss6;
create table patients (
    patientId int auto_increment primary key,
    fullName varchar(100) not null,
    dateOfBirth date,
    gender varchar(10),
    phoneNumber varchar(15)
);

create table doctors (
    doctorId int auto_increment primary key,
    fullName varchar(100) not null,
    specialization varchar(50),
    phoneNumber varchar(15),
    email varchar(100) unique
);

create table appointments (
    appointmentId int auto_increment primary key,
    patientId int,
    doctorId int,
    appointmentDate datetime not null,
    status varchar(20),
    foreign key (patientId) references patients(patientId),
    foreign key (doctorId) references doctors(doctorId)
);

create table medicalRecords (
    recordId int auto_increment primary key,
    patientId int,
    doctorId int,
    diagnosis text,
    treatmentPlan text,
    foreign key (patientId) references patients(patientId),
    foreign key (doctorId) references doctors(doctorId)
);

-- Insert dữ liệu vào bảng Patients (Thông tin bệnh nhân)
INSERT INTO Patients (FullName, DateOfBirth, Gender, PhoneNumber)
VALUES
    ('Nguyen Van An', '1985-05-15', 'Nam', '0901234567'),
    ('Tran Thi Binh', '1990-09-12', 'Nu', '0912345678'),
    ('Pham Van Cuong', '1978-03-20', 'Nam', '0923456789'),
    ('Le Thi Dung', '2000-11-25', 'Nu', '0934567890'),
    ('Vo Van Em', '1982-07-08', 'Nam', '0945678901'),
    ('Hoang Thi Phuong', '1995-01-18', 'Nu', '0956789012'),
    ('Ngo Van Giang', '1988-12-30', 'Nam', '0967890123'),
    ('Dang Thi Hanh', '1992-06-10', 'Nu', '0978901234'),
    ('Bui Van Hoa', '1975-10-22', 'Nam', '0989012345');

-- Insert dữ liệu vào bảng Doctors (Thông tin bác sĩ)
INSERT INTO Doctors (FullName, Specialization, PhoneNumber, Email)
VALUES
    ('Le Minh', 'Noi Tong Quat', '0908765432', 'leminh@hospital.vn'),
    ('Phan Huong', 'Nhi Khoa', '0918765432', 'phanhuong@hospital.vn'),
    ('Nguyen Tuan', 'Tim Mach', '0928765432', 'nguyentuan@hospital.vn'),
    ('Dang Quang', 'Than Kinh', '0938765432', 'dangquang@hospital.vn'),
    ('Hoang Dung', 'Da Lieu', '0948765432', 'hoangdung@hospital.vn'),
    ('Vu Hanh', 'Phu San', '0958765432', 'vuhanh@hospital.vn'),
    ('Tran An', 'Noi Tiet', '0968765432', 'tranan@hospital.vn'),
    ('Lam Phong', 'Ho Hap', '0978765432', 'lamphong@hospital.vn'),
    ('Pham Ha', 'Chan Thuong Chinh Hinh', '0988765432', 'phamha@hospital.vn');

-- Insert dữ liệu vào bảng Appointments (Lịch hẹn khám)
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Status)
VALUES
    (1, 2, '2025-02-01 09:00:00', 'Da Dat'), 
    (1, 2, '2025-02-15 14:00:00', 'Da Dat'), 
    (3, 1, '2025-01-29 10:30:00', 'Da Dat'), 
    (3, 1, '2025-01-30 10:50:00', 'Da Dat'), 
    (3, 1, '2025-02-06 12:30:00', 'Da Dat'), 
    (5, 3, '2025-01-30 08:00:00', 'Da Dat'), 
    (2, 4, '2025-02-03 16:00:00', 'Da Dat'), 
    (6, 6, '2025-02-10 10:00:00', 'Da Dat'), 
    (7, 7, '2025-02-15 11:30:00', 'Da Dat'), 
    (8, 8, '2025-02-20 09:00:00', 'Da Dat'), 
    (9, 9, '2025-02-25 14:30:00', 'Da Dat'); 

-- Insert dữ liệu vào bảng MedicalRecords (Hồ sơ y tế)
INSERT INTO MedicalRecords (PatientID, DoctorID, Diagnosis, TreatmentPlan)
VALUES
    (1, 2, 'Cam Cum', 'Nghi ngoi, uong nhieu nuoc, su dung paracetamol 500mg khi sot.'),
    (3, 1, 'Dau Dau Man Tinh', 'Kiem tra huyet ap dinh ky, giam cang thang, su dung thuoc giam dau khi can.'),
    (5, 3, 'Roi Loan Nhip Tim', 'Theo doi tim mach 1 tuan/lan, dung thuoc dieu hoa nhip tim.'),
    (2, 4, 'Dau Cot Song', 'Vat ly tri lieu, giam van dong manh.'),
    (4, 5, 'Viêm Da Tiep Xuc', 'Su dung kem boi da, tranh tiep xuc voi chat gay di ung.'),
    (6, 6, 'Thieu Mau', 'Tang cuong thuc pham giau sat, bo sung vitamin.'),
    (7, 7, 'Tieu Duong Type 2', 'Duy tri che do an lanh manh, kiem tra duong huyet thuong xuyen.'),
    (8, 8, 'Hen Suyen', 'Su dung thuoc xit hen hang ngay, tranh tiep xuc bui ban.'),
    (9, 9, 'Gay Xuong', 'Bo bot, kiem tra xuong dinh ky, vat ly tri lieu sau khi thao bot.');

select 
    d.fullname as DoctorName,
    d.specialization as Specialization,
    count(distinct a.patientid) as TotalPatients,
    count(a.appointmentid) as TotalAppointments,
    d.email as Email
from doctors d
join appointments a on d.doctorid = a.doctorid
group by d.doctorid, d.fullname, d.specialization, d.email
having count(a.appointmentid) > 1
order by TotalPatients desc, TotalAppointments desc
limit 5;


select 
    d.fullname as DoctorName,
    d.specialization as Specialization,
    count(distinct a.patientid) as TotalPatients,
    count(a.appointmentid) * 500000 as TotalEarnings,
    count(a.appointmentid) as TotalAppointments
from doctors d
join appointments a on d.doctorid = a.doctorid
group by d.doctorid, d.fullname, d.specialization
having count(a.appointmentid) * 500000 > 600000
order by TotalEarnings desc;


select 
    p.patientid as PatientID,
    p.fullname as PatientName,
    d.fullname as DoctorName,
    a.appointmentdate as AppointmentDate,
    timestampdiff(year, p.dateofbirth, curdate()) as Age,
    case 
        when timestampdiff(year, p.dateofbirth, curdate()) < 18 then 'Tre em'
        when timestampdiff(year, p.dateofbirth, curdate()) between 18 and 30 then 'Trung nien'
        when timestampdiff(year, p.dateofbirth, curdate()) between 31 and 40 then 'Qua thoi'
        when timestampdiff(year, p.dateofbirth, curdate()) between 41 and 50 then 'Lon tuoi'
        when timestampdiff(year, p.dateofbirth, curdate()) between 51 and 60 then 'Gia'
        else 'Nguoi cao tuoi'
    end as AgeGroup
from patients p
join appointments a on p.patientid = a.patientid
join doctors d on a.doctorid = d.doctorid
order by p.patientid;