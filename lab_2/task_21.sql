delete from fb.transfer
where id_transfer in (select id_transfer
					 from fb.transfer
					 where cost >= 1000 and cost <= 2000)
					 
-- Удалить в трансфере где cost >= 1000 и cost <= 2000