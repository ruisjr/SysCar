import static spark.Spark.get;
import java.util.TimeZone;
import javax.annotation.PostConstruct;

public class SysCar {

	@PostConstruct
	void started() {
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
	}

	public static void main(String[] args) {
		get("/hello", (req, res) -> "Hello, world");

		get("/hello/:name", (req, res) -> {
			return "Hello, " + req.params(":name");
		});
	}

}
