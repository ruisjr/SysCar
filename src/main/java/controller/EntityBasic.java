package controller;

import java.util.List;

@SuppressWarnings("rawtypes")
public class EntityBasic<T> extends GenericDao {

	@SuppressWarnings({ "unchecked", "hiding" })
	public <T> T save() {
		return (T) super.save(this);
	}

	public void delete(int primaryKey) {
		super.delete(Long.parseLong(Integer.toString(primaryKey)));
	}

	@SuppressWarnings("unchecked")
	public final T update() {
		return (T) super.update(this);
	}

	@SuppressWarnings("unchecked")
	public T findById(int primaryKey) {
		Long id = Long.valueOf(Integer.toString(primaryKey));
		return (T) super.findById(this.getClass(), id);
	}

	@SuppressWarnings("unchecked")
	public final List<T> findAll() {
		return super.findAll();
	}

	public final Long count() {
		return super.count();
	}

	public final boolean exists(Long primaryKey) {
		return super.exists(primaryKey);
	}

}
