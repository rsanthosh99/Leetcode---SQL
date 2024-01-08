select c.name as Customers
from Customers c
left join Orders o on o.customerId = c.id
group by c.id #Always group by ID never by name!
having count(o.id) = 0;