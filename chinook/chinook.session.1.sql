/*markdown
**Find which customers purchased which artists and where are the customers located, year-wise. Show the bill value and the staff that attended to them.**
*/

SELECT strftime('%Y', i.InvoiceDate) AS [Year],
    c.FirstName || ' ' || c.LastName AS [Customer],
    c.City AS [City],
    i.Total AS Amount,
    replace(GROUP_CONCAT(DISTINCT ar.Name), ',', ', ') AS [Artists],
    e.FirstName || ' ' || e.LastName AS [Employee]
FROM Invoice AS i
    INNER JOIN Customer AS c ON c.CustomerId = i.CustomerId
    INNER JOIN Employee AS e ON e.EmployeeId = c.SupportRepId
    INNER JOIN InvoiceLine AS il ON il.InvoiceId = i.InvoiceId
    INNER JOIN Track as tr ON tr.TrackId = il.TrackId
    INNER JOIN Album as al ON al.AlbumId = tr.AlbumId
    INNER JOIN Artist as ar ON ar.ArtistId = al.ArtistId
GROUP BY Year,
    Customer,
    c.City,
    Amount,
    Employee
ORDER BY Year ASC,
    Amount DESC
LIMIT 10 OFFSET 0;



/*markdown
**Longest Track by Artist**
*/

