SELECT S.student_id, student_name, sub.subject_name,
    COUNT(E.subject_name) AS attended_exams
FROM Students S JOIN Subjects sub LEFT JOIN Examinations E 
    USING(student_id, subject_name)
GROUP BY S.student_id, sub.subject_name
ORDER BY student_id, subject_name;
