# [183. Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/)

#### Suppose that a website contains two tables, the Customers table and the Orders table. Write a SQL query to find all customers who never order anything.

`Table: Customers.`
```sql
+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
```

`Table: Orders.`
```sql
+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
```
Using the above tables as example, return the following:
```sql
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+
```

## Solution 1:
Runtime:` 884 ms`, faster than `5.03%` 
```sql
SELECT 
    c.Name AS `Customers`
FROM 
    Customers AS c
Where
    c.id NOT IN
        (
            Select 
                o.CustomerId
            FROM 
                Orders AS o            
        )
;
```
## Solution 2. 
Runtime: `393 ms`, faster than `88.67%`
```sql
SELECT 
    Name AS 'Customers'
FROM 
    Customers c
LEFT JOIN 
    Orders o ON c.Id = o.CustomerId
WHERE 
    o.CustomerId IS NULL
```    

