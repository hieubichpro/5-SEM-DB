-- select * from market
update fb.transfer
set position = 'GK'
where id_transfer = 1

select * from fb.transfer
order by id_transfer

-- Изменить позицию футболиста, id_transfer которого равна 1