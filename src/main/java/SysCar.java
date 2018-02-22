import java.util.TimeZone;
import javax.annotation.PostConstruct;
import model.Veiculo.Veiculo;

public class SysCar {

	@PostConstruct
	void started() {
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
	}

	public static void main(String[] args) {
		System.out.println("Iniciando Aplicação.");
	
		Veiculo veiculo = new Veiculo();
		veiculo.setId(Long.parseLong("1"));
		veiculo.findById();
		
		System.out.println("Finalizando Aplicação.");
	}

}
