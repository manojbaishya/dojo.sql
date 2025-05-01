select
    i.InvoiceDate as 'date',
    c.FirstName as 'firstname',
    c.LastName as 'lastname',
    SUM(il.UnitPrice * il.Quantity) as "BillingAmount"
from
    Invoice i
inner join InvoiceLine il 
    on
    il.InvoiceId = i.InvoiceId
inner join Customer c
    on
    c.CustomerId = i.CustomerId
where
    c.FirstName is not null
group by
    i.InvoiceDate,
    c.FirstName,
    c.LastName
order by
    c.CustomerId asc
limit 200 offset 0;