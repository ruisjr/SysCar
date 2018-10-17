# coding=utf-8

__tablename__ = 'tabela'

class Dao(object):
    def __init__(self):
        pass

    def insert(self, values_dict):
        sql = 'INSERT INTO %s (%s) VALUES (%s)'
        print(sql)

    def update(self, campos_dict=None, where=None):
        sql = 'UPDATE %s SET %s WHERE %s'
        print(sql)

    def delete(self, where_dict=None):
        sql = 'DELETE FROM %s %s'
        where_str = ""
        
        if where_dict is not None:
            where_str = " WHERE true "
            for campo, valor in where_dict.items():
                # TODO Tratar neste momento os tipos vindos do dicionário (Integer, String, Float, Date e Time)
                where_str = where_str + " AND " + campo + '=' + str(self.__get_value_typed(valor))
                print(where_str)

        sql = sql % (__tablename__, where_str)
        print(sql)

    def select(self, campos_dict=None, where_dict=None):
        sql = 'SELECT %s FROM %s %s'
        campos_str = ""
        where_str = ""

        if campos_dict is None:
            campos_str = "*"

        if where_dict is not None:
            where_str = " WHERE true "
            for campo, valor in where_dict.items():
                # TODO Tratar neste momento os tipos vindos do dicionário (Integer, String, Float, Date e Time)
                where_str = where_str + " AND " + campo + '=' + str(self.__get_value_typed(valor))
                print(where_str)

        sql = sql % (campos_str, __tablename__, where_str)
        print(sql)

    def __get_value_typed(self, value):
        value_typed = ""
        
        return value_typed