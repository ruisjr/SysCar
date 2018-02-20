import java.util.TimeZone;
import javax.annotation.PostConstruct;
import model.Usuario;

public class SysCar {
	
	@PostConstruct
	  void started() {
	    TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
	  }

	public static void main(String[] args) {
		System.out.println("Iniciando Aplicação.");
		
		Usuario usu = new Usuario(1);
		usu.remove();
		
		//usu.setId(1);
		//usu.setNome("Rui");
		//usu.setSenha("senha");
		//usu.save();
		
		//GenericDao<Usuario> dao = new GenericDao<Usuario>();
		//dao.save(usu);
		
		System.out.println("Salvo com sucesso");
		
		//dao.remove(Usuario.class, Long.valueOf("0"));
	}

}
