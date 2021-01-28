# [177. Nth Highest Salary](https://leetcode.com/problems/nth-highest-salary/)

## Write a SQL query to get the nth highest salary from the Employee table.

```sql
+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```
## For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

```sql
-------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
```


## Solution:

HINTS:
 - The first position is 0
 - Declare new variable to the right position of parametre N 


```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
set M = N - 1;
  RETURN (
      # Write your MySQL query statement below.
      
            SELECT DISTINCT Salary FROM Employee
            ORDER BY Salary DESC
            LIMIT 1 OFFSET M
  );
END
```

