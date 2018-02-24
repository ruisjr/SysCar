package services;

import java.util.Collection;
import org.omg.CORBA.UserException;
import model.Usuario.Usuario;

public interface UsuarioService {

	public void addUser(Usuario user);

	public Collection<Usuario> getUsers();

	public Usuario getUsuario(String id);

	public Usuario editUser(Usuario user) throws UserException;

	public void deleteUser(String id);

	public boolean userExist(String id);
}
