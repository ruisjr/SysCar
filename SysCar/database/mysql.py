# coding=utf-8
__author__ = 'Rui Ignácio da Silva Júnior'
__exe_name__ = 'SysCar'

from mysql.connector import connection


class MySqlConnector(object):

	def __init__(self, config):
		self.__config = config
		self._connector = None
		self.__error = ""

	def get_connection(self):
		user = self.__config.get_user()
		password = self.__config.get_password()
		host = self.__config.get_host()
		database = self.__config.get_database()

		try:
			if self.__connection is None:
				self.__connection = connection.MySQLConnection(user, password, host, database)
		except (Exception, __error):
			self.__error = str(error)

		return self.__connection

	def close_connection(self):
		self.__connection.close()

	def get_error(self):
		return self.__error