# coding=utf-8
__author__ = 'Rui Ignácio da Silva Júnior'
__exe_name__ = 'SysCar'

import sys

class Config(object):

	def __init__(self):
		self.__database = None
		self.__erro = ""
		self.__database = ""
		self.__port = 0
		self.__password = ""
		self._host = ""
		self.__user = ""

	# Getters
	def get_database(self):
		return self.__database
	
	def get_port(self):
		return self.__port

	def get_user(self):
		return self.__user

	def get_password(self):
		return self.__password

	def get_host(self):
		return self._host

	def get_erro(self):
		return self.__erro

	# Setters
	def set_erro(self, value):
		self.__erro = value