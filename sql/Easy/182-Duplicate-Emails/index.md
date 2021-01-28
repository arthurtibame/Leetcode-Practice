# [182. Duplicate Emails](https://leetcode.com/problems/duplicate-emails/)

#### Write a SQL query to find all duplicate emails in a table named Person.
```sql
+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
```
#### For example, your query should return the following for the above table:
```sql
+---------+
| Email   |
+---------+
| a@b.com |
+---------+
```

## Solution:

```sql
SELECT
    p.Email
FROM
    Person p
GROUP BY
    p.Email
HAVING 
    COUNT(*) > 1;
```