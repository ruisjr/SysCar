package services;

import java.util.Collection;
import org.omg.CORBA.UserException;
import model.Usuario.Usuario;

public interface UsuarioService {

	public static void addUser(Usuario user) {
	}

	public Collection<Usuario> getUsers();

	public Usuario getUser(String id);

	public Usuario editUser(Usuario user) throws UserException;

	public void deleteUser(String id);

	public boolean userExist(String id);
}
