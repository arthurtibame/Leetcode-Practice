# [184. Department Highest Salary](https://leetcode.com/problems/department-highest-salary/)

#### The `Employee` table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.
```sql
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
```
#### The `Department` table holds all departments of the company.

```sql
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
```

#### Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).

```sql
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
```

#### Explanation: 
Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.

## Solution 1. Mysql CTE
```sql
WITH cte as(
    SELECT 
        max(salary) AS t, 
        departmentid AS did
    FROM 
        employee 
    GROUP BY
        departmentid
)

SELECT 
    d.name as `Department`, 
    e.name as `Employee`, 
    cte.t as `Salary`
FROM 
    cte, department d, employee e
WHERE
    cte.t=e.salary and 
    d.id=e.departmentid and 
    cte.did=d.id
```
## Solution 2. 
```sql
# Write your MySQL query statement below
SELECT 
    d.name AS `Department`,
    e.name AS `Employee`,
    e.Salary
FROM 
    Employee AS e
JOIN 
    Department as d ON e.DepartmentId=d.id
WHERE
    (e.DepartmentId, e.Salary) IN 
    (
        SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY
            DepartmentId
    )
;

```