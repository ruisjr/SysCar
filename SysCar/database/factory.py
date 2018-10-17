# coding=utf-8
__author__ = 'Rui Ignácio da Silva Júnior'
__exe_name__ = 'SysCar'

from database.mysql import MySqlConnector

class Factory(object):

	def __init__(self, config):
		self.__database = None
		self.__config = config

	def get_connection(self):
		conn = None

		#cria a string de conexão
		if self.__config.get_database() == 'mysql':
			MySqlC = MySqlConnector(self.__config)
			conn.MySqlC.get_Connection()
		else:
			raise Exception("Banco de dados não está homologado.")