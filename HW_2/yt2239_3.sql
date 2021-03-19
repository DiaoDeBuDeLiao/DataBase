#2.1
SELECT
  cour.Title
FROM
  student s
  JOIN enrollment e on s.SSN = e.Student_SSN
  JOIN class cls on e.Class_no = cls.Class_no
  JOIN course cour on cls.D_code = cour.D_code
  AND cls.C_no = cour.C_no
WHERE
  s.S_Name = 'John';
#2.2
SELECT
  cour.Title,
  fa.F_Name
FROM
  class cls
  JOIN course cour on cls.D_code = cour.D_code
  AND cls.C_no = cour.C_no
  JOIN faculty fa on cls.Instructor_SSN = fa.SSN;
#2.3
update
  class
set
  Instructor_SSN = NULL
where
  Class_no = 10001;
SELECT
  cour.Title,
  fa.F_Name
FROM
  class cls
  JOIN course cour on cls.D_code = cour.D_code
  AND cls.C_no = cour.C_no
  LEFT JOIN faculty fa on cls.Instructor_SSN = fa.SSN;
update
  class
set
  Instructor_SSN = '134400029'
where
  Class_no = 10001;
#2.4
SELECT
  fa.SSN,
  fa.F_Name
FROM
  faculty fa
  LEFT JOIN class cls ON fa.SSN = cls.Instructor_SSN
WHERE
  cls.Class_no is NULL;
#2.5
SELECT
  s.SSN
FROM
  student s
  join enrollment e on s.SSN = e.Student_SSN
  join class cls on cls.Class_no = e.Class_no
WHERE
  cls.D_code = 'INFS'
  AND cls.C_no = 614
  AND not EXISTS (
    select
      *
    from
      (
        select
          *
        from
          prereq p
        where
          p.D_code = 'INFS'
          AND p.C_no = 614
      ) as temp
    where
      not EXISTS (
        select
          *
        from
          transcript t
        where
          t.Student_SSN = s.SSN
          AND t.D_code = temp.P_code
          AND t.C_no = temp.P_no
      )
  );
#2.6
SELECT
  s.SSN,
  s.S_Name
from
  student s
  join enrollment e on s.SSN = e.Student_SSN
group by
  s.SSN
having
  count(*) = 1;
#2.7
SELECT
  (
    (
      SELECT
        count(DISTINCT s.SSN)
      from
        Student s
        join enrollment e on s.SSN = e.Student_SSN
        join class cls on e.Class_no = cls.Class_no
      where
        cls.D_code = 'INFS'
    ) / count(*)
  ) as Percent
from
  Student s;
#2.8
SELECT
  fa.F_Name
FROM
  faculty fa
  LEFT JOIN class cls ON fa.SSN = cls.Instructor_SSN
GROUP BY
  fa.SSN
HAVING
  COUNT(cls.class_no) >= 2
ORDER BY
  COUNT(cls.class_no) DESC;
#2.9
SELECT
  s.SSN,
  s.S_Name,
  COUNT(*) as NO_Class_taken
FROM
  student s
  JOIN enrollment e ON s.SSN = e.Student_SSN
GROUP BY
  s.SSN
ORDER BY
  COUNT(*) ASC,
  SSN ASC;
#2.10
SELECT
  s.SSN,
  s.S_Name,
  COUNT(e.Student_SSN) as NO_Class_taken
FROM
  student s
  LEFT JOIN enrollment e ON s.SSN = e.Student_SSN
GROUP BY
  s.SSN
ORDER BY
  COUNT(e.Student_SSN) ASC,
  SSN ASC;
#2.11
SELECT
  fa.F_Name,
  COUNT(*)
FROM
  faculty fa
  JOIN class cls ON fa.SSN = cls.Instructor_SSN
GROUP BY
  fa.SSN
HAVING
  COUNT(*) >= 2 *(
    SELECT
      COUNT(*)
    FROM
      class
    WHERE
      Instructor_SSN in (
        SELECT
          SSN
        from
          faculty
        where
          F_Name = 'Smith'
      )
  )
  AND COUNT(*) <> 0;
#2.12
  CREATE VIEW A as (
    SELECT
      D_code,
      C_no,
      COUNT(*) AS cnt
    FROM
      prereq p
    GROUP BY
      D_code,
      C_no
  );
SELECT
  D_code,
  C_no
FROM
  A
WHERE
  cnt = (
    SELECT
      min(cnt)
    FROM
      A
  );
#2.13
SELECT
  COUNT(D_code)
FROM
  Department
WHERE
  Chair_SSN is NULL;
#2.14
SELECT
  SSN,
  S_Name
FROM
  (
    SELECT
      s.SSN,
      s.S_Name,
      IFNULL(SUM(cour.units), 0)
    FROM
      student s
      LEFT JOIN transcript t ON s.SSN = t.Student_SSN
      LEFT JOIN Course cour ON cour.D_code = t.D_code
      AND cour.C_no = t.C_no
    GROUP BY
      s.SSN
  ) prev(SSN, S_Name, prev_Units) NATURAL
  JOIN (
    SELECT
      s.SSN,
      s.S_Name,
      IFNULL(SUM(cour.units), 0)
    FROM
      student s
      LEFT JOIN enrollment e ON s.SSN = e.Student_SSN
      LEFT JOIN class cls ON cls.Class_no = e.Class_no
      LEFT JOIN course cour ON cour.D_code = cls.D_code
      AND cour.C_no = cls.C_no
    GROUP BY
      s.SSN
  ) curr(SSN, S_Name, curr_Units)
WHERE
  (prev_Units + curr_Units) >= 9;
#2.15
Update
  faculty
set
  f_rank = 'Assoc'
where
  ssn = '156676789';
Update
  faculty
set
  f_rank = 'Assist'
where
  ssn = '244400001';
CREATE VIEW de_fa as (
    SELECT
      D_code,
      D_Name,
      F_Rank
    FROM
      department d NATURAL
      JOIN faculty fa
  );
SELECT
  D_code,
  maxRank,
  COUNT(*)
FROM
  (
    SELECT
      D_code,
      max(F_Rank) maxRank
    FROM
      de_fa
    GROUP BY
      D_code
  ) T NATURAL
  JOIN de_fa
WHERE
  F_Rank = maxRank
GROUP BY
  D_code,
  maxRank;
Update
  faculty
set
  f_rank = 'FULL'
where
  ssn = '156676789';
Update
  faculty
set
  f_rank = 'FULL'
where
  ssn = '244400001';