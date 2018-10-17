import gi

gi.require_version("Gtk", "3.0")
from gi.repository import Gtk

from base.base import WindowBase
from database.dao import Dao

class MainWindow(WindowBase):

	def __init__(self):
		super(MainWindow, self).__init__()
		
		self.configure()

		dao = Dao()
		where_dict = {
			"codigo": 1234,
			"nome": 'rui'
		}
		dao.select(where_dict=where_dict)

	def configure(self):
		# Chama o método da classe principal
		super(MainWindow, self).configure()

		self.set_window("glade/menu_principal.glade")
		item = self.get_item("item_sair")


window = MainWindow()
#window.show()
Gtk.main()
Gtk.main_quit()