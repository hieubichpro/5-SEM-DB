-- select * from market
update fb.transfer
set cost = (select avg(cost) from fb.transfer where position = 'GK')
where id_transfer = 2
select * from market where id_transfer = 2

-- обновить цену футболиста. id трансфер равна 2