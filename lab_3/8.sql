create or replace procedure deleteIndex(name_schema varchar, name_table varchar)
as
$$
declare row_data record;
begin
   for row_data in (select indexname as m
               FROM pg_indexes
               WHERE schemaname = name_schema and tablename = name_table)
   loop
      execute 'drop index '|| row_data.m;
   end loop;
end;
$$
language plpgsql;