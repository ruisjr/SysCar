import gi
gi.require_version("Gtk", "3.0")

from gi.repository import Gtk

class WindowBase(object):

	def __init__(self):
		self.__builder = Gtk.Builder()
		self.__window = None

		self.__builder.connect_signals(self)

	def configure(self):
		pass

	def show(self):
		self.__window.show_all()

    # Setters
	def set_window(self, filename):
		self.__builder.add_from_file(filename)
		self.__window = self.__builder.get_object("main")
		
		# Conecta o sinal para destruir a janela criada
		self.__window.connect("destroy", self.onDestroy)

	def get_window(self, widget):
		return self.__window

	def get_item(self, name):
		return self.__builder.get_object(name)

    # Signals
	def onDestroy(self, *args):
		Gtk.main_quit()