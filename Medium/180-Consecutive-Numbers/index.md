# [180. Consecutive Numbers](https://leetcode.com/problems/consecutive-numbers/)

#### Table: Logs

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
id is the primary key for this table.
```

#### Write an SQL query to find all numbers that appear at least three times consecutively. Return the result table in any order. The query result format is in the following example:

```
Logs table:
+----+-----+
| Id | Num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+

Result table:
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
1 is the only number that appears consecutively for at least three times.
```

## Solution:
```SQL
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs AS l1 
    JOIN Logs AS l2
        ON l1.id = l2.id -1 AND l1.num = l2.num
    JOIN Logs AS l3
        ON l1.id = l3.id - 2 AND l2.num = l3.num
```
