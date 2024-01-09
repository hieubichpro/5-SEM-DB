create or replace procedure deleteFootballerByID(id_param int)
as
$$
plan = plpy.prepare("delete from fb.footballer where id_footballer = $1;", ["integer"])
plpy.execute(plan, [id_param])
$$
language plpython3u;

call deleteFootballerByID(12);