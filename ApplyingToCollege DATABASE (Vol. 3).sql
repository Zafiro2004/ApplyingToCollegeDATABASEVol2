-- 40. Insert a new college with name 'UIB', in the state 'IB', and with size 11500.
INSERT INTO COLLEGES(NAME, STATE, ENROLLMENT) VALUES ('UIB','IB',11500);

-- 41. Insert into APPLIES with college 'UIB', major 'IB', AND DECISION NULL all students
-- who didn't apply anywhere.
INSERT INTO APPLIES (SID, COLLAGE, MAJOR, DECISION)
SELECT s.id, 'UIB', 'IB', NULL
FROM STUDENTS s
WHERE NOT EXISTS (
    SELECT 1
    FROM APPLIES a
    WHERE SID = ID
);
-- 42. Admit to UIB EE all students who were refused (decision=false) in EE elsewhere.
INSERT INTO APPLIES (SID, COLLAGE, MAJOR, DECISION)
SELECT DISTINCT SID, 'UIB', 'EE', 1
FROM APPLIES
WHERE MAJOR = 'EE' AND DECISION = 0 AND COLLAGE != 'UIB';

-- 43. Delete all students who applied to more than two different majors.
DELETE FROM STUDENTS WHERE ID IN(
    SELECT SID
    FROM APPLIES
    GROUP BY SID
    HAVING COUNT(DISTINCT MAJOR) > 2
);