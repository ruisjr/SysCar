package services.usuario;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.EntityBasic;
import services.GenericService;

@SuppressWarnings("rawtypes")
public class UsuarioServiceImpl implements GenericService {

	static final Logger LOGGER = LoggerFactory.getLogger(UsuarioServiceImpl.class);
	private Class classe = null;

	@SuppressWarnings({ "unchecked" })
	private <T> T getClassInstance() {
		T instance = null;
		try {
			instance = (T) Class.forName(classe.getName()).newInstance();
		} catch (InstantiationException e) {
			LOGGER.error(String.format("Erro ao instanciar a classe %s", classe.getSimpleName()));
		} catch (IllegalAccessException e) {
			LOGGER.error(String.format("Erro ao tentar acessar a classe %s", classe.getSimpleName()));
		} catch (ClassNotFoundException e) {
			LOGGER.error("Classe %s não foi encontrada", classe.getSimpleName());
		}
		return instance;
	}

	@Override
	public <T> void append() {
		T instance = getClassInstance();
		((EntityBasic) instance).save();
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> List<T> getItems() {
		T instance = getClassInstance();
		return ((EntityBasic) instance).findAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T getItem(String primaryKey) {
		T instance = getClassInstance();
		return (T) ((EntityBasic) instance).findById(Integer.parseInt(primaryKey));
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> void update(T object) {
		((EntityBasic) object).update(object);
	}

	@Override
	public <T> void delete(T object, String primaryKey) {
		((EntityBasic) object).delete(Long.parseLong(primaryKey));
	}

	@Override
	public <T> boolean exists(T object, String primaryKey) {
		return ((EntityBasic) object).exists(Long.parseLong(primaryKey));
	}

	public UsuarioServiceImpl(Class clazz) {
		this.classe = clazz;
	}
}