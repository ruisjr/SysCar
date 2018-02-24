package services;

import java.util.Collections;

public interface InterfaceServices {

	public <T> void addObject(Class<T> clazz);

	public Collections getObjects();

	public <T> Class<T> getObject();

	public <T> Class<T> editObject(Class<T> clazz) throws Exception;

	public void deleteObject(String id);

	public boolean objectExist(String id);

}
