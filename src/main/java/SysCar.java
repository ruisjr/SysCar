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

		/*ModeloVeiculo modelo = new ModeloVeiculo();
		modelo.setNome("2.0 MPFI");
		modelo.save();
		
		MarcaVeiculo marca = new MarcaVeiculo();
		marca.setNome("Chevrolet");
		marca.save();
		
		Cor cor = new Cor();
		cor.setNome("Preto");
		cor.save();
		
		Veiculo veiculo = new Veiculo();
		veiculo.setNome("Vectra");
		veiculo.setMarca(marca);
		veiculo.setModelo(modelo);
		veiculo.setTipoVeiculo(EnumTipoVeiculo.GRANDE);
		veiculo.setCor(cor);
		veiculo.setValor(BigDecimal.valueOf(5.00));
		veiculo.save();*/
		
		Veiculo veiculo = new Veiculo();
		veiculo.setId(Long.parseLong("1"));
		veiculo.findById();
		
		System.out.println("Finalizando Aplicação.");
	}

}
