import psycopg2
from peewee import *
from time import *
from datetime import *

my_connection = con = PostgresqlDatabase(
    host = 'localhost',
    user = 'postgres',
    password = '123456789',
    database = 'myDB',
)

cursor = my_connection.cursor()
class BaseModel(Model):
    class Meta:
        database = my_connection

class Employee(BaseModel):
    id = IntegerField(column_name='id_empl')
    fio = CharField(column_name='fio')
    birthday = DateField(column_name='birth')
    depart = CharField(column_name='department')
    class Meta:
        table_name = 'Employees'

class Record(BaseModel):
    id_event = IntegerField(column_name='id_event')
    id_emp = IntegerField(column_name='id_empl')
    rdate = DateField(column_name='date_visit')
    wday = CharField(column_name='day_visit')
    rtime = TimeField(column_name='time_visit')
    rtype = IntegerField(column_name='type_visit')
    class Meta:
        table_name = 'Events'

def print_query(query):
 u_b = query.dicts().execute()
 for elem in u_b:
    print(elem)
    
query = Employee.select(Employee.fio)
print_query(query)
