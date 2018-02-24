import static spark.Spark.get;
import java.util.TimeZone;
import javax.annotation.PostConstruct;
import com.google.gson.Gson;
import model.Usuario.EnumeratorTipoUsuario;
import model.Usuario.Usuario;
import services.StandardResponse;
import services.StatusResponse;
import services.UsuarioService;

public class SysCar {

	@PostConstruct
	void started() {
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
	}

	public static void main(String[] args) {
		run();

		get("/users", (request, response) -> {
			response.type("application/json");
			Usuario user = new Usuario();// new Gson().fromJson(request.body(), Usuario.class);
			user.find(Long.valueOf("1"));
			UsuarioService.addUser(user);

			return new Gson().toJson(new StandardResponse(StatusResponse.SUCCESS));
		});

		get("/hello", (req, res) -> "Hello, world");

		get("/hello/:name", (req, res) -> {
			return "Hello, " + req.params(":name");
		});
	}

	public static void run() {
		Usuario usuario = new Usuario();
		usuario.setNome("Rui");
		usuario.setSenha("senha");
		usuario.setTipoUsuario(EnumeratorTipoUsuario.MASTER);
		usuario.save();
		usuario = null;
	}

}
