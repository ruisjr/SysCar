# coding=utf-8

__author__ = 'Rui Ignácio da Silva Júnior'
__exe_name__ = 'SysCar'

from database.factory import Factory

__tablename__ = 'tabela'

class Dao(object):

	def __init__(self):
		self.__connection = None

	def get_connection(self, config):
		'''
			Objective..: Obter a conexão com o banco de dados proveniente da configuração carregada.
			Parameters.: config -> Classe com a configuração carregada pelo disco rígido.
			Return.....: Retorna a conexão com a classe do banco de dados. Ex: MySQL
		'''
		factory = Factory()
		self.__connection = factory.get_connection(config.get_database())

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
                # TODO Tratar neste momento os tipos vindos do dicionÃ¡rio (Integer, String, Float, Date e Time)
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
                # TODO Tratar neste momento os tipos vindos do dicionÃ¡rio (Integer, String, Float, Date e Time)
                where_str = where_str + " AND " + campo + '=' + str(self.__get_value_typed(valor))
                print(where_str)

        sql = sql % (campos_str, __tablename__, where_str)
        print(sql)

   def __get_value_typed(self, value):
        value_typed = ""
        
        return value_typed