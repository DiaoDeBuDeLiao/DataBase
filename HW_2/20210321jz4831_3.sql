# 1
SELECT c.Title
FROM Course c, Student s, Enrollment e, Class cls
WHERE s.S_Name =  'John'
AND s.SSN = e.Student_SSN
AND e.Class_no = cls.Class_no
AND cls.C_no = c.C_no;

# 2
SELECT c.Title, f.F_Name
FROM Course c, Class cls, Faculty f
WHERE c.C_no = cls.C_no
AND c.D_code = cls.D_code
AND cls.Instructor_SSN = f.SSN;

# 3
update
  class
set
  Instructor_SSN = NULL
where
  Class_no = 10001;

SELECT c.Title, f.F_Name
FROM Course c, Class cls, Faculty f
WHERE c.C_no = cls.C_no
AND c.D_code = cls.D_code
AND cls.Instructor_SSN = f.SSN
UNION
SELECT c.Title, NULL
FROM Course c, Class cls
WHERE c.C_no = cls.C_no
AND c.D_code = cls.D_code
AND cls.Instructor_SSN IS NULL;

update
  class
set
  Instructor_SSN = '134400029'
where
  Class_no = 10001;


# 4
SELECT f.SSN, f.F_Name
FROM Faculty f
WHERE f.SSN NOT IN (
                    SELECT f.SSN
                    FROM Faculty f, Class c
                    WHERE c.Instructor_SSN = f.SSN
                    );

# 5
SELECT *
FROM(
    SELECT e.Student_SSN
    FROM Enrollment e, Class cls
    WHERE e.Class_no = cls.Class_no
    AND cls.D_code = 'INFS'
    AND cls.C_no = 614
    )
WHERE Student_SSN IN (
    SELECT e.Student_SSN
    FROM Enrollment e, Class cls, Prereq p
    WHERE e.Class_no = cls.Class_no
    AND cls.C_no = p.P_no
    AND cls.D_code = p.P_code
    AND p.C_no = 614
    AND p.D_code = 'INFS'
);

SELECT e.Student_SSN
    FROM Enrollment e, Class cls
    WHERE e.Class_no = cls.Class_no
    AND cls.D_code = 'INFS'
    AND cls.C_no = 614;

SELECT t.Student_SSN
    FROM Transcript t, Prereq p
    WHERE t.C_no = p.P_no
    AND t.D_code = p.P_code
    AND p.C_no = 614
    AND p.D_code = 'INFS';