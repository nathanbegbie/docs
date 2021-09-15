# SQL

In order to create a specific datetime that you can use to filter, use the `TO_TIMESTAMP` function like so:

```sql
TO_TIMESTAMP('05-10-2020 17:45', 'DD-MM-YYYY HH24:MI')
```

If you want to add a blank value to a list of query results:

```sql
SELECT ' ' as names
UNION
SELECT names
FROM products
ORDER BY name ASC
```
