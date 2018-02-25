package services;

import java.util.Collection;

public interface GenericService {

	public <T> void append();

	public <T> Collection<T> getItems();

	public <T> T getItem(String primaryKey);

	public <T> void update(T object);

	public <T> void delete(T object, String primaryKey);

	public <T> boolean exists(T object, String primaryKey);
}
