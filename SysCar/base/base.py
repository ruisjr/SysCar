import gi
gi.require_version("Gtk", "3.0")

from gi.repository import Gtk

class WindowBase(object):
	window = None

	def main(self):
		window = self.get_window()

	def __init__(self):
		self.__builder = Gtk.Builder()

	def configure(self):
		self.__builder.connect("destroy", self.onDestroy)

	def show(self):
		self.__builder.show()

	def get_window(self):
		return self.__builder

    # Setters
	def set_window(self, filename):
		self.__builder.add_from_file(filename)
		self.__builder.get_object("main")

    # Signals
	def onDestroy(self, *args):
		Gtk.main_quit()