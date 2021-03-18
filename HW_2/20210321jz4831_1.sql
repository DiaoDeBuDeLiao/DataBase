create table Department(
    D_code varchar(10),
    D_name varchar(25),
    Chair_SSN varchar(10),
    primary key(D_code)
);

create table Course(
    D_code varchar(10),
    C_no int,
    Title varchar(25),
    Units int,
    primary key(D_code, C_no)
);

create table Prereq(
    D_code varchar(10),
    C_no int,
    P_code varchar(10),
    P_no int,
    primary key(D_code, C_no, P_code, P_no)
);

create table Faculty(
    SSN varchar(10),
    F_Name varchar(15),
    F_Rank varchar(10),
    Office varchar(10),
    D_Code varchar(10),
    primary key(SSN)
);

create table Class(
    Class_no int,
    D_code varchar(10),
    C_no int,
    Instructor_SSN varchar(10),
    primary key(Class_no)
);

create table Student(
    SSN varchar(10),
    S_Name varchar(15),
    Status varchar(6),
    Major varchar(10),
    primary key(SSN)
);

create table Enrollment(
    Student_SSN varchar(10),
    Class_no int,
    primary key(Student_SSN, Class_no)
);

create table Transcript(
    Student_SSN varchar(10),
    D_code varchar(10),
    C_no int,
    Grade char(1),
    primary key(Student_SSN, D_code, C_no)
);

alter table Department add
    foreign key(Chair_SSN) references Faculty(SSN);

alter table Course add
    foreign key(D_code) references Department(D_code);

alter table Prereq add
    foreign key(D_code, C_no) references Course(D_code, C_no);
alter table Prereq add
    foreign key(P_code, P_no) references Course(D_code, C_no);

alter table Class add
    foreign key(D_code, C_no) references Course(D_code, C_no);
alter table Class add
    foreign key(Instructor_SSN) references Faculty(SSN);

alter table Faculty add
    foreign key(D_code) references Department(D_code);

alter table Student add
    foreign key(Major) references Department(D_code);

alter table Enrollment add
    foreign key(Class_no) references Class(Class_no);
alter table Enrollment add
    foreign key(Student_SSN) references Student(SSN);

alter table Transcript add
    foreign key(Student_SSN) references Student(SSN);
alter table Transcript add
    foreign key(D_code, C_no) references Course(D_code, C_no);
