# total amount generated by cities genre wise on daily basis

select week_day,genre,city,total_amount from
(select *,rank() over(partition by week_day, city order by total_amount desc) de from
(select week_day,genre,city,sum(amount) total_amount from
(select *,weekday(booking_date) week_day
from bookings b
join games g on b.bookings_game_id = g.game_id
join payments p on g.game_id = p.game_payment_id
join address a on p.address_id = a.addres_id) tr
group by week_day,genre,city) de) sw
where de = 1;
