Question:
Given the EMP table, write an SQL statement to select
employees whose salary is greater than the average salary
of the department they are working in.

Database: Oracle SQL
Topic: Subquery / Correlated Subquery
===========================================================
*/


-- =========================================================
-- 1. CREATE EMP TABLE
-- =========================================================

CREATE TABLE EMP (
    EMPNO    NUMBER(4),
    ENAME    VARCHAR2(10),
    JOB      VARCHAR2(15),
    MGR      NUMBER(4),
    HIREDATE DATE,
    SAL      NUMBER(7,2),
    COMM     NUMBER(7,2),
    DEPTNO   NUMBER(2)
);


-- =========================================================
-- 2. INSERT SAMPLE DATA
-- =========================================================

INSERT INTO EMP VALUES
(7839, 'KING', 'PRESIDENT', NULL, DATE '1981-11-17', 5100, NULL, 10);

INSERT INTO EMP VALUES
(7698, 'BLAKE', 'MANAGER', 7839, DATE '1981-05-01', 2850, NULL, 30);

INSERT INTO EMP VALUES
(7782, 'CLARK', 'MANAGER', 7839, DATE '1981-06-09', 2550, NULL, 10);

INSERT INTO EMP VALUES
(7566, 'JONES', 'MANAGER', 7839, DATE '1981-04-02', 2975, NULL, 20);

INSERT INTO EMP VALUES
(7788, 'SCOTT', 'ANALYST', 7566, DATE '1987-04-19', 3000, NULL, 20);

INSERT INTO EMP VALUES
(7902, 'FORD', 'ANALYST', 7566, DATE '1981-12-03', 3000, NULL, 20);

INSERT INTO EMP VALUES
(7369, 'SMITH', 'CLERK', 7902, DATE '1980-12-17', 800, NULL, 20);

INSERT INTO EMP VALUES
(7499, 'ALLEN', 'SALESMAN', 7698, DATE '1981-02-20', 1600, 300, 30);

INSERT INTO EMP VALUES
(7521, 'WARD', 'SALESMAN', 7698, DATE '1981-02-22', 1250, 500, 30);

INSERT INTO EMP VALUES
(7654, 'MARTIN', 'SALESMAN', 7698, DATE '1981-09-28', 1250, 1400, 30);

INSERT INTO EMP VALUES
(7844, 'TURNER', 'SALESMAN', 7698, DATE '1981-09-08', 1500, 0, 30);

INSERT INTO EMP VALUES
(7876, 'ADAMS', 'CLERK', 7788, DATE '1987-05-23', 1100, NULL, 20);

INSERT INTO EMP VALUES
(7900, 'JAMES', 'CLERK', 7698, DATE '1981-12-03', 950, NULL, 30);

INSERT INTO EMP VALUES
(7934, 'MILLER', 'CLERK', 7782, DATE '1982-01-23', 1400, NULL, 10);

COMMIT;


-- =========================================================
-- 3. SOLUTION
-- =========================================================

/*
Find employees whose salary is greater than
the average salary of their own department.
*/

SELECT
    EMPNO,
    ENAME,
    JOB,
    SAL,
    DEPTNO
FROM EMP E
WHERE SAL > (
    SELECT AVG(SAL)
    FROM EMP
    WHERE DEPTNO = E.DEPTNO
);


-- =========================================================
-- 4. SOLUTION WITH DEPARTMENT AVERAGE
-- =========================================================

/*
This version also displays the average salary
of the employee's department.
*/

SELECT
    E.EMPNO,
    E.ENAME,
    E.JOB,
    E.SAL,
    E.DEPTNO,
    (
        SELECT AVG(SAL)
        FROM EMP
        WHERE DEPTNO = E.DEPTNO
    ) AS DEPT_AVG_SAL
FROM EMP E
WHERE E.SAL > (
    SELECT AVG(SAL)
    FROM EMP
    WHERE DEPTNO = E.DEPTNO
);


-- =========================================================
-- 5. ALTERNATIVE SOLUTION USING JOIN
-- =========================================================

SELECT
    E.EMPNO,
    E.ENAME,
    E.JOB,
    E.SAL,
    E.DEPTNO,
    D.AVG_SAL
FROM EMP E
JOIN (
    SELECT
        DEPTNO,
        AVG(SAL) AS AVG_SAL
    FROM EMP
    GROUP BY DEPTNO
) D
ON E.DEPTNO = D.DEPTNO
WHERE E.SAL > D.AVG_SAL;
