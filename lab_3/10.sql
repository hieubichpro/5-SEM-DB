--Добавить информацию о футболисте в таблицу, если его зарплата выше средней среди футболистов, иначе вывести соответствующее сообщение. 
 
CREATE OR REPLACE FUNCTION insert_info_with_limitation() 
RETURNS TRIGGER 
AS $$ 
BEGIN 
    IF new.salary < (SELECT AVG(salary) FROM fb.footballer) THEN 
        RAISE NOTICE 'Too low salary'; 
        RETURN NULL; 
    ELSE 
        INSERT INTO fb.footballer(first_name, last_name, age, country, salary, phone_number)  
        VALUES(new.first_name, new.last_name, new.age, new.country, new.salary, new.phone_number); 
 
        RAISE NOTICE 'Information has been added to the table footballer'; 
        RETURN NEW; 
    END IF; 
END; 
$$ LANGUAGE PLPGSQL; 
 
DROP VIEW footballer_view; 
CREATE VIEW footballer_view 
AS 
    SELECT * 
    FROM fb.footballer; 
 
CREATE TRIGGER insert_with_lim_trigger INSTEAD OF INSERT ON footballer_view 
FOR ROW EXECUTE PROCEDURE insert_info_with_limitation(); 
 
DELETE FROM fb.footballer  
WHERE last_name = 'Messi'; 
 
INSERT INTO footballer_view(first_name, last_name, age, country, salary, phone_number)  
VALUES('Lionel', 'Messi', 34, 'Argentina', 10000000,'+1234567'); 
 
SELECT * 
FROM fb.footballer 
WHERE last_name = 'Messi';