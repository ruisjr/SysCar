package controller;

import java.util.List;

@SuppressWarnings("rawtypes")
public class EntityBasic<T> extends GenericDao {

	@SuppressWarnings({ "unchecked", "hiding" })
	public <T> T save() {
		return (T) super.save(this.getClass());
	}

	@SuppressWarnings("unchecked")
	public final boolean delete() {
		return super.delete(this.getClass());
	}

	@SuppressWarnings("unchecked")
	public final T update() {
		return (T) super.update(this.getClass());
	}

	@SuppressWarnings({ "hiding", "unchecked" })
	public final <T> T findById(Long primaryKey) {
		return (T) super.find(primaryKey);
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
