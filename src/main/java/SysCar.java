import static spark.Spark.get;
import java.util.TimeZone;
import javax.annotation.PostConstruct;
import com.google.gson.Gson;
import model.Usuario.EnumeratorTipoUsuario;
import model.Usuario.Usuario;
import services.UsuarioServiceImpl;

public class SysCar {

	@PostConstruct
	void started() {
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
	}

	public static void main(String[] args) {
		//run();

		/*get("/users", (request, response) -> {
			response.type("application/json");
			
			Usuario user = new Gson().fromJson(request.body(), Usuario.class);
			UsuarioService.addUser(user);

			return new Gson().toJson(new StandardResponse(StatusResponse.SUCCESS), new Gson().toJson(UsuarioService.getUsuario()));
		});*/

		//get("/hello", (req, res) -> "Hello, world");

		get("/users/:id", (request, response) -> {
			response.type("application/json");
			
			String id = request.params(":id");
			UsuarioServiceImpl service = new UsuarioServiceImpl();
			Usuario usuario = service.getUsuario(id);
			
			return new Gson().toJson(new Gson().toJson(usuario));
		});
		
		/*post("/users", (request, response) -> {
			response.type("application/json");
			
			return new Gson().toJson(new StandardResponse(StatusResponse.SUCCESS));
		})*/;
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
