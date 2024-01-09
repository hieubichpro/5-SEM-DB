import psycopg2

my_connection = psycopg2.connect(
    host = 'localhost',
    user = 'postgres',
    password = '123456789',
    database = 'myDB',
)

cursor = my_connection.cursor()

def scalar_query(country):
    sql_query = f"select avg(age) from fb.footballer where country = '{country}'"
    cursor.execute(sql_query)
    print(cursor.fetchone())
    
def multiple_join(beg_goal, end_goal):
    sql_query = f"select f.first_name, cl.name, t.num_of_goals\
                from fb.footballer f \
                join fb.transfer t on f.id_footballer = t.id_footballer \
                join fb.club cl on cl.id_club = t.id_club \
                where t.num_of_goals between {beg_goal} and {end_goal}"
    cursor.execute(sql_query)
    for row_data in cursor.fetchall():
        print(row_data)
        
def otb_table():
    sql_query = f"with tmp_table as \
                (select first_name, salary from fb.footballer) \
                select first_name, salary, row_number() over (order by salary) r1 \
                from tmp_table;"
    cursor.execute(sql_query)
    for row_data in cursor.fetchall():
        print(row_data)
        
def meta_data(name_schema):
    sql_query = f"select tablename \
                from pg_tables \
                where schemaname = '{name_schema}'"
    cursor.execute(sql_query)
    for row_data in cursor.fetchall():
        print(row_data)

def call_scalar_function():
    sql_query = "select first_name, work_experience, salary, total_salary(work_experience, salary)\
                from fb.coach"
    cursor.execute(sql_query)
    for row_data in cursor.fetchall():
        print(row_data)

def call_table_function():
    sql_query = "select * from fn2()"
    cursor.execute(sql_query)
    for row_data in cursor.fetchall():
        print(row_data)

def call_procedure(id_footballer):
    sql_query = f"call pr5({id_footballer});\
            select * from fb.footballer where id_footballer = {id_footballer};"
    cursor.execute(sql_query)
    for row_data in cursor.fetchall():
        print(row_data)
        
def call_system_function():
    sql_query = "select * from current_database();"
    cursor.execute(sql_query)
    for row_data in cursor.fetchone():
        print(row_data)
        
def create_table():
    sql_query = "create table if not exists fb.friend \
        ( \
            id_footballer serial not null primary key, \
            name_footballer varchar(100) not null, \
            id_his_friend int)"
    cursor.execute(sql_query)
    print("Таблица создана")
    my_connection.commit()

def insert_into_table(name_footballer, id_his_friend):
    sql_query = f"insert into fb.friend(name_footballer, id_his_friend) values \
                ('{name_footballer}', {id_his_friend})"
    cursor.execute(sql_query)
    print("Добавлено")
    cursor.execute("select * from fb.friend")
    for row_data in cursor.fetchall():
        print(row_data)

MSG = "\n\t\tМеню\n\n \
\t1. Выполнить скалярный запрос \n \
\t2. Выполнить запрос с несколькими соединениями (JOIN) \n \
\t3. Выполнить запрос с ОТВ(CTE) и оконными функциями \n \
\t4. Выполнить запрос к метаданным \n \
\t5. Вызвать скалярную функцию \n \
\t6. Вызвать многооператорную табличную функцию \n \
\t7. Вызвать хранимую процедуру \n \
\t8. Вызвать системную функцию \n \
\t9. Создать таблицу в базе данных, соответствующую тематике БД \n \
\t10. Выполнить вставку данных в созданную таблицу \n \
\t0. Выход \n\n \
\tВыбор: "
        

# choice = -1
# while choice != 0:
#     choice = int(input(MSG))
    
#     if 1 <= choice <= 10:
#         if choice == 1:
#             country = input("Введите страну: ")
#             scalar_query(country)
#         elif choice == 2:
#             beg_goal = input("Введите начало: ")
#             end_goal = input("Введите конец: ")
#             multiple_join(beg_goal, end_goal)
#         elif choice == 3:
#             otb_table()
#         elif choice == 4:
#             schema = input("Введите схему: ")
#             meta_data(schema)
#         elif choice == 5:
#             call_scalar_function()
#         elif choice == 6:
#             call_table_function()
#         elif choice == 7:
#             id_footballer = input("Введите ID футболиста: ")
#             call_procedure(id_footballer)
#         elif choice == 8:
#             call_system_function()
#         elif choice == 9:
#             create_table()
#         else:
#             name = input("Введите имя футболиста: ")
#             id_friend = input("Введите ID его друга: ")
#             try:
#                 insert_into_table(name, id_friend)
#             except:
#                 print("Таблица не создана")
#         # print_result()
#     else:
#         choice = 0
        
def zashit(country):
    sql_query = f"select f.first_name from \
            fb.footballer f\
            join fb.transfer t on f.id_footballer = t.id_footballer\
            join fb.club cl on cl.id_club = t.id_club\
            where cl.country = '{country}' and t.position = 'GK'"
    cursor.execute(sql_query)
    for row_data in cursor.fetchall():
        print(row_data)
country = input("Enter country: ")
zashit(country)
my_connection.close()
cursor.close()