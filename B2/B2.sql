select o.CustomerName, o.ProductName, SUM(o.Quantity) as TotalQuantity from orders o
group by o.CustomerName, o.ProductName
having sum(o.Quantity) > 1;

select o.CustomerName, o.OrderDate, SUM(o.Quantity) as TotalQuantity from orders o
group by o.CustomerName, o.OrderDate
having sum(o.Quantity) > 2;

select o.CustomerName, o.OrderDate, SUM(o.Quantity * o.Price) as TotalSpent
from orders o
group by o.CustomerName, o.OrderDate
having SUM(o.Quantity * o.Price) > 20000000;
