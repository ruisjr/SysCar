package controller;

import java.util.List;
import javax.persistence.EntityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("rawtypes")
public class GenericDao<T extends EntityBasic> {

	static final Logger LOGGER = LoggerFactory.getLogger(GenericDao.class);
	static EntityManager manager = ConnectionFactory.getEntityManager();

	@SuppressWarnings({ "hiding" })
	public <T> T save(T entity) {
		if (entity != null) {
			try {
				manager.getTransaction().begin();
				manager.persist(entity);
				manager.getTransaction().commit();

				LOGGER.info(this.getClass().getName() + " saved.");
			} catch (Exception e) {
				manager.getTransaction().rollback();
				LOGGER.error(e.getMessage());
			}
		}
		return (T) entity;
	}

	@SuppressWarnings("unchecked")
	public boolean delete(Long primaryKey) {
		boolean result = false;

		T obj = findById((Class<T>) this.getClass(), primaryKey);

		try {
			manager.getTransaction().begin();
			manager.remove(obj);
			manager.getTransaction().commit();
			result = true;

			LOGGER.info(this.getClass().getName() + " deleted.");
		} catch (Exception e) {
			manager.getTransaction().rollback();
			LOGGER.error(e.getMessage());
		}
		return result;
	}

	@SuppressWarnings({ "hiding" })
	public <T> T update(T entity) {
		try {
			manager.getTransaction().begin();
			manager.merge(entity);
			manager.getTransaction().commit();

			LOGGER.info(this.getClass().getName() + " updated.");
		} catch (Exception e) {
			manager.getTransaction().rollback();
			LOGGER.error(e.getMessage());
		}
		return (T) entity;
	}

	public T findById(Class<T> clazz, Long primaryKey) {
		if (primaryKey == null) {
			return null;
		} else {
			return manager.find(clazz, primaryKey);
		}
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		String sqlStr = "Select e from " + this.getClass().getSimpleName() + " e";
		return (List<T>) manager.createQuery(sqlStr, this.getClass()).getResultList();
	}

	public Long count() {
		String sqlStr = "Select count(e) from " + this.getClass().getSimpleName() + " e";
		return (Long) manager.createQuery(sqlStr, Long.class).getSingleResult();
	}

	@SuppressWarnings("unchecked")
	public boolean exists(Long primaryKey) {
		return findById((Class<T>) this.getClass(), primaryKey) != null;
	}
}