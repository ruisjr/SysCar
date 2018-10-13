import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk

from base.base import WindowBase

class MainWindow(WindowBase):

	def __init__(self):
		super(MainWindow, self).__init__()
		
		self.configure()

	def configure(self):
		# Chama o método da classe principal
		super(MainWindow, self).configure()

		self.set_window("glade/menu_principal.glade")
		item = self.get_item("item_sair")
	#	item.connect("select", self.fechar)

	def fechar(self, widget):
		self.get_window().destroy()


window = MainWindow()
window.show()
Gtk.main()