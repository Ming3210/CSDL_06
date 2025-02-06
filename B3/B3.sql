select min(o.Price) as minPrice, max(o.Price) as maxPrice from orders o ;

select o.CustomerName, count(o.OrderID)  as OrderCount from orders o group by o.CustomerName;

select min(o.OrderDate) as early, max(o.OrderDate) as latest from orders o ;
