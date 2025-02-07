delete from appointments 
where doctorid = (select doctorid from doctors where fullname = 'Phan Huong')
and appointmentdate < curdate();

select 
    a.appointmentid as AppointmentID,
    p.fullname as PatientName, 
    d.fullname as DoctorName,
    a.appointmentdate as AppointmentDate,
    a.status as Status
from appointments a
join patients p on a.patientid = p.patientid
join doctors d on a.doctorid = d.doctorid
order by a.appointmentdate;


update Appointments 
set Status = 'Dang cho'
where AppointmentDate >= '2025-02-06'
and PatientID = (select PatientID from Patients where FullName = 'Nguyen Van An')
and DoctorID = (select DoctorID from Doctors where FullName = 'Phan Huong');

select 
    a.AppointmentID,
    (select FullName from Patients where PatientID = a.PatientID) as PatientName,
    (select FullName from Doctors where DoctorID = a.DoctorID) as DoctorName,
    a.AppointmentDate,
    a.Status
from Appointments a
order by a.AppointmentDate;


select 
    (select fullname from patientsb10 where patientid = a.patientid) as patientname,
    (select fullname from doctorsb10 where doctorid = a.doctorid) as doctorname,
    a.appointmentdate,
    (select diagnosis 
     from medicalrecordsb10 
     where patientid = a.patientid 
     and doctorid = a.doctorid 
     limit 1) as diagnosis
from appointmentsb10 a
where a.patientid in (
    select patientid 
    from appointmentsb10 
    group by patientid, doctorid
    having count(appointmentid) >= 2
);


select 
    concat('BENH NHAN: ', upper((select FullName from Patients where PatientID = a.PatientID)),
           ' - BAC SI: ', upper((select FullName from Doctors where DoctorID = a.DoctorID))) as ParticipantInfo,
    a.AppointmentDate,
    (select Diagnosis from MedicalRecords 
     where PatientID = a.PatientID and DoctorID = a.DoctorID) as Diagnosis,
    a.Status
from Appointments a
order by a.AppointmentDate;


select 
    concat('BENH NHAN: ', upper(p.FullName), ' - BAC SI: ', upper(d.FullName)) as ParticipantInfo,
    a.AppointmentDate,
    mr.Diagnosis,
    a.Status
from Appointments a
join Patients p on a.PatientID = p.PatientID
join Doctors d on a.DoctorID = d.DoctorID
left join MedicalRecords mr on a.PatientID = mr.PatientID and a.DoctorID = mr.DoctorID
order by a.AppointmentDate;