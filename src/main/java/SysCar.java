import java.util.TimeZone;
import javax.annotation.PostConstruct;
import model.EnumeratorTipoUsuario;
import model.Usuario;

public class SysCar {

	@PostConstruct
	void started() {
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
	}

	public static void main(String[] args) {
		System.out.println("Iniciando Aplicação.");

		Usuario usu = new Usuario();
		usu.remove();

		// usu.setId(1);
		usu.setNome("Rui");
		usu.setSenha("senha");
		usu.setTipoUsuario(EnumeratorTipoUsuario.ADMINISTRATOR);
		usu.save();

		// GenericDao<Usuario> dao = new GenericDao<Usuario>();
		// dao.save(usu);
		// dao.remove(Long.valueOf("1"));

		// get("/hello", (req, res) -> "Hello World");
	}

}
