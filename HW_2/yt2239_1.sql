create DATABASE universityDB;
use universityDB;
create TABLE Department (
  D_code VARCHAR (30),
  D_Name VARCHAR (30),
  Chair_SSN CHAR (9),
  PRIMARY KEY (D_code)
);
create TABLE Course (
  D_code VARCHAR (30),
  C_no INT,
  Title VARCHAR (30),
  Units INT,
  PRIMARY KEY (D_code, C_no)
);
create TABLE Prereq(
  D_code VARCHAR (30),
  C_no INT,
  P_code VARCHAR (30),
  P_no INT,
  PRIMARY KEY (D_code, C_no, P_code, P_no)
);
create TABLE Faculty(
  SSN CHAR (9),
  F_Name VARCHAR (30),
  F_Rank VARCHAR (30),
  Office VARCHAR (30),
  D_code VARCHAR (30),
  PRIMARY KEY (SSN)
);
create TABLE Class(
  Class_no INT,
  D_code VARCHAR (30),
  C_no INT,
  Instructor_SSN CHAR (9),
  PRIMARY KEY (Class_no)
);
create TABLE Student(
  SSN CHAR (9),
  S_Name VARCHAR (30),
  Status VARCHAR (30),
  Major VARCHAR (30),
  PRIMARY KEY (SSN)
);
create TABLE Enrollment(
  Student_SSN CHAR (9),
  Class_no INT,
  PRIMARY KEY (Student_SSN, Class_no)
);
create TABLE Transcript(
  Student_SSN CHAR (9),
  D_code VARCHAR (30),
  C_no INT,
  Grade CHAR (1),
  PRIMARY KEY (Student_SSN, D_code, C_no)
);
alter table
  Department
add
  FOREIGN KEY (Chair_SSN) REFERENCES Faculty(SSN);
alter table
  Course
add
  FOREIGN KEY (D_code) REFERENCES Department(D_code);
alter table
  Prereq
add
  FOREIGN KEY (D_code, C_no) REFERENCES Course(D_code, C_no);
alter table
  Prereq
add
  FOREIGN KEY (P_code, P_no) REFERENCES Course(D_code, C_no);
alter table
  Faculty
add
  FOREIGN KEY (D_code) REFERENCES Department(D_code);
alter table
  Class
add
  FOREIGN KEY (D_code, C_no) REFERENCES Course(D_code, C_no);
alter table
  Class
add
  FOREIGN KEY (Instructor_SSN) REFERENCES Faculty(SSN);
alter table
  Student
add
  FOREIGN KEY (Major) REFERENCES Department(D_code);
alter table
  Enrollment
add
  FOREIGN KEY (Student_SSN) REFERENCES Student(SSN);
alter table
  Enrollment
add
  FOREIGN KEY (Class_no) REFERENCES Class(Class_no);
alter table
  Transcript
add
  FOREIGN KEY (Student_SSN) REFERENCES Student(SSN);
alter table
  Transcript
add
  FOREIGN KEY (D_code, C_no) REFERENCES Course(D_code, C_no);
# commands that may be used:
  # show foreign keys
SELECT
  TABLE_NAME,
  COLUMN_NAME,
  CONSTRAINT_NAME,
  REFERENCED_TABLE_NAME,
  REFERENCED_COLUMN_NAME
FROM
  INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
  REFERENCED_TABLE_SCHEMA = 'universityDB'
  AND (REFERENCED_TABLE_NAME = 'Faculty');
# drop foreign keys
alter table
  department drop foreign key department_ibfk_2;