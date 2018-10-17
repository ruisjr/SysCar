# coding=utf-8

__author__ = 'Rui Ign�cio da Silva J�nior'
__exe_name__ = 'SysCar'

from database.factory import Factory

class Dao(object):

	def __init__(self):
		self.__connection = None

	def get_connection(self, config):
		'''
			Objective..: Obter a conex�o com o banco de dados proveniente da configura��o carregada.
			Parameters.: config -> Classe com a configura��o carregada pelo disco r�gido.
			Return.....: Retorna a conex�o com a classe do banco de dados. Ex: MySQL
		'''
		factory = Factory()
		self.__connection = factory.get_connection(config.get_database())

	def update(self, select_dict, where):
		if select_dict is None:
			raise Exception("Campos para UPDATE n�o foram informados.")

		sql = " update %s set " % __table_name

	def insert(self, sql):
		pass

	def delete(self, sql):
		pass

	def select(self, sql):
		pass
