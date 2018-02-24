package services;

import java.util.Collection;
import org.omg.CORBA.UserException;
import model.Usuario.Usuario;

public class UsuarioServiceImpl implements UsuarioService {

	@Override
	public void addUser(Usuario user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Collection<Usuario> getUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Usuario getUsuario(String id) {
		Usuario usuario = new Usuario();
		return (Usuario) usuario.findById(Integer.parseInt(id));
	}

	@Override
	public Usuario editUser(Usuario user) throws UserException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean userExist(String id) {
		// TODO Auto-generated method stub
		return false;
	}

}
