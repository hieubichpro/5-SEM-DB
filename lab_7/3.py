from peewee import *

my_connection = PostgresqlDatabase('postgres', user = 'postgres', password = '123456789', host = 'localhost')
class BaseModel(Model):
    class Meta:
        database = my_connection
        
class Footballer(BaseModel):
    id = PrimaryKeyField(column_name='id')
    f_name = CharField(column_name='f_name')
    l_name = CharField(column_name='l_name')
    age = IntegerField(column_name='age')
    country = 
    