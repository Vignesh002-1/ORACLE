 Find rows where 'A' exists in any of COL1, COL2, COL3, COL4, COL5
-- without using the OR keyword.

-- Create table
CREATE TABLE employee (
    S_NO NUMBER,
    COL1 VARCHAR2(10),
    COL2 VARCHAR2(10),
    COL3 VARCHAR2(10),
    COL4 VARCHAR2(10),
    COL5 VARCHAR2(10)
);

-- Insert sample data
INSERT INTO employee VALUES (1, 'A', 'B', 'C', 'D', 'E');
INSERT INTO employee VALUES (2, NULL, 'A', 'B', 'C', 'D');
INSERT INTO employee VALUES (3, 'E', NULL, NULL, NULL, 'A');
INSERT INTO employee VALUES (4, NULL, 'A', 'E', NULL, 'D');
INSERT INTO employee VALUES (5, 'E', 'D', 'C', 'B', NULL);

COMMIT;

-- Solution
SELECT *
FROM employee
WHERE 'A' IN (COL1, COL2, COL3, COL4, COL5);
