# Top 3 customers with max spendings and their genre

select city,name,amount,genre from
(select city,name,amount,genre,rank() over( partition by city,amount order by name) kw
from games g
join payments p on p.game_payment_id = g.game_id
join customers c on c.customer_id = p.customer_payment_id
join address a on p.address_id = a.address_id) df
where amount = 37000 and (kw = 1 or kw = 2 or kw = 3);
