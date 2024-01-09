import psycopg2
from py_linq import *
from reader import *

#Задание 1

def task_1():
    footballers = Enumerable(read_footballer())
    clubs = Enumerable(read_club())
    transfers = Enumerable(read_transfer())
    # # 1-й запрос
    # res = footballers.where(lambda x: x['country'] == 'Spain').select(lambda x: {x['f_name'], x['country']})
    # for row in res:
    #     print(row)
        
    # #2-й запрос
    # res = footballers.group_by(key_names=['country'], key=lambda x: x['country']).select(
    #     lambda g: {'key': g.key.country, 'cnt': g.count()}).to_list()
    # for row in res:
    #     print(row)
        
    # #3-й запрос
    # res = footballers.avg(lambda x: x['age'])
    # print(res)
    
    # #4-й запрос
    # res = footballers.where(lambda x: x['age'] >= 20 and x['age'] <= 23).order_by(lambda x: x['age']).select(lambda x: {x['f_name'], x['age']})
    # for row in res:
    #     print(row)
    
    # # 5-й запрос
    # res = clubs.where(lambda x: x['country'] == 'Germany').all(lambda x: x['fans'] > 500000)
    # print(res)
    
def task_2():
    my_connection = psycopg2.connect(
        host = 'localhost',
        user = 'postgres',
        password = '123456789',
        database = 'myDB')
    print("К базе данных успешно подключена")
    #Чтение из JSON документа
    my_cursor = my_connection.cursor()
    my_cursor.execute("select * from footballer_json")
    data = my_cursor.fetchmany(10)
    arr = []
    for row in data:
        arr.append({'id':row[0], 'f_name':row[1], 'l_name':row[2],
                    'age':row[3], 'country':row[4], 'salary':row[5], 'phone':row[6]})
            
    #Обновление JSON документа
    id = 7
    for footballer in arr:
        if footballer['id'] == id:
            footballer['country'] = 'Russia'
    for f in arr:
        print(f)
        
    #Добавление в JSON документ
    arr.append({'id':20, 'f_name':'Ivan', 'l_name':'Ivanov',
        'age':25, 'country':'Russia', 'salary':400000, 'phone':'+79373857381'})
    
    my_cursor.close()
    my_connection.close()
    
    
# task_1()
# task_2()
# task_3()
