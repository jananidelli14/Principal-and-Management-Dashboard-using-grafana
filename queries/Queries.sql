1)TOTAL PARTICIPATION REACH :
SELECT 
  SUM(CAST("total_participants" AS NUMERIC)) AS "Total Participation Reach"
FROM "hari"
WHERE "college_name" IN ($college)
  AND "academic_year" IN ($year)
  AND "department_name" IN ($dept);

2)Average Package (LPA):
SELECT 
  ROUND(AVG(CAST("avg_package_lpa" AS NUMERIC)), 2) AS "Avg Package (LPA)"
FROM "hari"
WHERE "college_name" IN ($college)
  AND "department_name" IN ($dept)
  AND "academic_year" IN ($year)
  AND "mentor_name" IN ($mentor)
  AND "student_name" IN ($student);

3)Hackathon Project Completion Rate:
SELECT 
  (SUM(CAST("projects_completed" AS NUMERIC)) * 100.0 / 
   NULLIF(SUM(CAST("projects_submitted" AS NUMERIC)), 0)) AS "Success Rate"
FROM "hari"
WHERE "college_name" IN ($college)
  AND "department_name" IN ($dept)
  AND "academic_year" IN ($year)
  AND "mentor_name" IN ($mentor)
  AND "student_name" IN ($student);

4)Top 10 Student Performers:
SELECT 
  student_name AS "Student",
  AVG(problem_solving_score_avg::numeric) AS "Performance Score"
FROM hari
WHERE college_name IN ($college)
  AND academic_year IN ($year)
GROUP BY student_name
ORDER BY "Performance Score" DESC
LIMIT 10;

5)Lab & Software Utilization:
SELECT 
  AVG(CAST("lab_utilization_pct" AS NUMERIC)) AS "Lab Utilization (%)"
FROM "hari"
WHERE "college_name" IN ($college)
  AND "department_name" IN ($dept)
  AND "academic_year" IN ($year)
  AND "mentor_name" IN ($mentor)
  AND "student_name" IN ($student);

6)Gender Participation Ratio
SELECT 
  'Female Students' AS metric, 
  AVG(CAST("female_participation_pct" AS NUMERIC)) AS percentage
FROM "hari"
WHERE "college_name" IN ($college)
  AND "department_name" IN ($dept)
  AND "academic_year" IN ($year)
  AND "mentor_name" IN ($mentor)
  AND "student_name" IN ($student)

UNION ALL

SELECT 
  'Male Students' AS metric, 
  (100 - AVG(CAST("female_participation_pct" AS NUMERIC))) AS percentage
FROM "hari"
WHERE "college_name" IN ($college)
  AND "department_name" IN ($dept)
  AND "academic_year" IN ($year)
  AND "mentor_name" IN ($mentor)
  AND "student_name" IN ($student);

7)Top-10 Performing Departments
SELECT 
  department_name AS "Department",
  AVG(NULLIF(problem_solving_score_avg, '')::numeric) AS "Avg Performance Score"
FROM hari
WHERE college_name IN ($college)
  AND academic_year IN ($year)
GROUP BY department_name
ORDER BY "Avg Performance Score" DESC
LIMIT 10;


8)Student Performance Segmentation by Skill Level:
SELECT 
  student_name AS "Student",
  department_name AS "Department",
  mentor_name AS "Mentor",
  ROUND(NULLIF(problem_solving_score_avg, '')::numeric, 2) AS "Tech Score",
  CASE 
    WHEN NULLIF(problem_solving_score_avg, '')::numeric >= 80 THEN 'Elite (80+)'
    WHEN NULLIF(problem_solving_score_avg, '')::numeric >= 65 THEN 'Pro (65–79)'
    WHEN NULLIF(problem_solving_score_avg, '')::numeric >= 50 THEN 'Intermediate (50–64)'
    ELSE 'Beginner (<50)'
  END AS "Performance Category"
FROM hari
WHERE college_name IN ($college)
  AND department_name IN ($dept)
  AND academic_year IN ($year)
  AND student_name IN ($student)
  AND mentor_name IN ($mentor)
ORDER BY 
  "Performance Category",
  "Tech Score" DESC;


9)Faculty Mentorship by Department:
SELECT 
  mentor_name AS "Mentor",
  ROUND(AVG(NULLIF(problem_solving_score_avg, '')::numeric), 2) AS "Mentor Impact Score"
FROM hari
WHERE college_name IN ($college)
  AND department_name IN ($dept)
  AND academic_year IN ($year)
  AND mentor_name IN ($mentor)
GROUP BY mentor_name
ORDER BY "Mentor Impact Score" DESC
LIMIT 5;


10)Hackathon Impact on Student Academic Readiness:
SELECT 
  CASE
    WHEN NULLIF(problem_solving_score_avg, '')::numeric >= 75 
      THEN 'Ready for Advanced Opportunities'
    WHEN NULLIF(problem_solving_score_avg, '')::numeric BETWEEN 55 AND 74 
      THEN 'Moderately Prepared'
    ELSE 'Needs Further Training'
  END AS "Readiness Level",
  COUNT(DISTINCT student_name) AS "Number of Students"
FROM hari
WHERE college_name IN ($college)
  AND department_name IN ($dept)
  AND academic_year IN ($year)
  AND student_name IN ($student)
  AND mentor_name IN ($mentor)
GROUP BY 
  CASE
    WHEN NULLIF(problem_solving_score_avg, '')::numeric >= 75 
      THEN 'Ready for Advanced Opportunities'
    WHEN NULLIF(problem_solving_score_avg, '')::numeric BETWEEN 55 AND 74 
      THEN 'Moderately Prepared'
    ELSE 'Needs Further Training'
  END
ORDER BY "Number of Students" DESC;


11)Top-3 Colleges:
SELECT 
  college_name AS "College",
  ROUND(AVG(NULLIF(problem_solving_score_avg, '')::numeric), 2) AS "Avg Tech Score",
  COUNT(DISTINCT student_name) AS "Participants"
FROM hari
GROUP BY college_name
ORDER BY "Avg Tech Score" DESC
LIMIT 3;


12)Hackathon(overview of all the tables):
SELECT 
  academic_year AS "Year",
  department_name AS "Department",
  mode AS "Mode",
  NULLIF(total_participants, '')::numeric AS "Students",
  NULLIF(prizes_won_count, '')::numeric AS "Prizes",
  ROUND(NULLIF(problem_solving_score_avg, '')::numeric, 2) AS "Tech Score",
  NULLIF(students_placed, '')::numeric AS "Placed",
  ROUND(NULLIF(highest_package_lpa, '')::numeric, 2) AS "Max Package (LPA)",
  ROUND(NULLIF(budget_utilized, '')::numeric, 2) AS "Budget (₹)",
  software_tools_used AS "Tools Used"
FROM hari
WHERE college_name IN ($college)
  AND department_name IN ($dept)
  AND academic_year IN ($year)
  AND student_name IN ($student)
  AND mentor_name IN ($mentor)
ORDER BY academic_year DESC, prizes_won_count DESC;

