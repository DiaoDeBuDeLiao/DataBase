/*--Yiyi Tong yt2239, Jiahui Zhou jz4831--*/

INSERT INTO
  Department
VALUES
  ('INFS', 'Information System', NULL),
  ('ENGL', 'English', NULL),
  ('MATH', 'Mathematics', NULL),
  ('BUSI', 'Business', NULL),
  ('GEOP', 'Geophysics', NULL);
INSERT INTO
  Course
VALUES
  ('INFS', 614, 'Database', 3),
  ('INFS', 600, 'Operating System', 3),
  ('INFS', 762, 'Security', 3),
  ('ENGL', 200, 'Grammar', 3),
  ('ENGL', 400, 'Technical Writing', 2),
  ('MATH', 321, 'Calculus', 3),
  ('MATH', 501, 'Advance Algebra', 3),
  ('BUSI', 620, 'Finance', 2),
  ('BUSI', 580, 'Accounting', 3),
  ('INFS', 501, 'Discrete Math', 3);
INSERT INTO
  Prereq
VALUES
  ('INFS', 614, 'INFS', 600),
  ('INFS', 614, 'MATH', 321),
  ('ENGL', 400, 'ENGL', 200),
  ('INFS', 614, 'INFS', 501);
INSERT INTO
  Faculty
VALUES
  ('134400029', 'Jones', 'Full', 'S500', 'INFS'),
  ('244400001', 'Smith', 'Full', 'S200', 'ENGL'),
  ('243466681', 'Lyle', 'Assist', 'S211', 'INFS'),
  ('235456788', 'Lindsay', 'Assist', 'T101', 'MATH'),
  ('235466789', 'Kudlic', 'Assoc', 'S101', 'INFS'),
  ('154456789', 'King', 'Assist', 'R201', 'ENGL'),
  ('166678789', 'Korth', 'Assist', 'T001', 'BUSI'),
  ('177776789', 'Fisherman', 'Assist', 'S040', 'INFS'),
  ('147777678', 'Hays', 'Full', 'S300', 'MATH'),
  ('156676789', 'Jackson', 'Full', 'R400', 'BUSI');
INSERT INTO
  Class
VALUES
  (10001, 'INFS', 600, '134400029'),
  (10002, 'INFS', 614, '243466681'),
  (10003, 'INFS', 762, '134400029'),
  (10004, 'INFS', 614, '235466789'),
  (20001, 'ENGL', 200, '154456789'),
  (20002, 'ENGL', 400, '244400001'),
  (30001, 'MATH', 501, '235456788'),
  (30002, 'MATH', 321, '235456788'),
  (40001, 'BUSI', 620, '156676789'),
  (40002, 'BUSI', 580, '166678789');
INSERT INTO
  Student
VALUES
  ('324513111', 'Tuner', 'Under', 'ENGL'),
  ('415671238', 'William', 'Grad', 'INFS'),
  ('521090112', 'Adam', 'Grad', 'INFS'),
  ('900081239', 'Johnson', 'Grad', 'MATH'),
  ('701281118', 'Glenn', 'Grad', 'MATH'),
  ('654322221', 'Brooks', 'Non', 'INFS'),
  ('600000001', 'John', 'Under', 'BUSI'),
  ('601111111', 'Bob', 'Grad', 'BUSI'),
  ('244400001', 'Smith', 'Non', 'BUSI'),
  ('811111111', 'Clinton', 'Grad', 'INFS'),
  ('911111111', 'Alex', 'Under', 'MATH'),
  ('711111111', 'Peter', 'Grad', 'INFS'),
  ('300000000', 'Simpson', 'Grad', 'INFS'),
  ('500000001', 'Michael', 'Grad', 'MATH'),
  ('411111110', 'Jean', 'Under', 'MATH'),
  ('544443333', 'Julia', 'Under', 'ENGL'),
  ('633354444', 'Ann', 'Under', 'BUSI');
INSERT INTO
  Enrollment
VALUES
  ('324513111', 20001),
  ('415671238', 10002),
  ('415671238', 10003),
  ('521090112', 10001),
  ('900081239', 30001),
  ('701281118', 10001),
  ('701281118', 30001),
  ('654322221', 10002),
  ('600000001', 20002),
  ('600000001', 40001),
  ('600000001', 40002),
  ('601111111', 40002),
  ('601111111', 20002),
  ('244400001', 40001),
  ('811111111', 10004),
  ('911111111', 30001),
  ('300000000', 10001),
  ('500000001', 30001),
  ('411111110', 30002),
  ('544443333', 20002),
  ('633354444', 40001);
INSERT INTO
  Transcript
VALUES
  ('415671238', 'INFS', 600, 'A'),
  ('521090112', 'ENGL', 200, 'B'),
  ('600000001', 'ENGL', 200, 'A'),
  ('811111111', 'INFS', 600, 'A'),
  ('811111111', 'MATH', 321, 'B'),
  ('811111111', 'INFS', 501, 'C');
update
  Department
set
  Chair_SSN = '134400029'
where
  D_code = 'INFS';
update
  Department
set
  Chair_SSN = '244400001'
where
  D_code = 'ENGL';
update
  Department
set
  Chair_SSN = '147777678'
where
  D_code = 'MATH';
update
  Department
set
  Chair_SSN = '156676789'
where
  D_code = 'BUSI';
update
  Department
set
  Chair_SSN = '134400029'
where
  D_code = 'GEOP';