package controller;

import java.util.List;
import javax.persistence.EntityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@SuppressWarnings("rawtypes")
public class GenericDao<T extends EntityBasic> {

	static final Logger LOGGER = LoggerFactory.getLogger(GenericDao.class);
	static EntityManager manager = ConnectionFactory.getEntityManager();

	@SuppressWarnings({ "hiding", "unchecked" })
	public <T> T save(Class<T> entity) {
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

	public boolean delete(Class<T> entity) {
		boolean result = false;
		try {
			manager.getTransaction().begin();
			manager.remove(entity);
			manager.getTransaction().commit();
			result = true;

			LOGGER.info(this.getClass().getName() + " deleted.");
		} catch (Exception e) {
			manager.getTransaction().rollback();
			LOGGER.error(e.getMessage());
		}
		return result;
	}

	@SuppressWarnings({ "hiding", "unchecked" })
	public <T> T update(Class<T> entity) {
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

	@SuppressWarnings({ "hiding", "unchecked" })
	public <T> T find(Long primaryKey) {
		if (primaryKey == null) {
			return null;
		} else {
			return (T) manager.find(this.getClass(), primaryKey);
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

	public boolean exists(Long primaryKey) {
		return this.find(primaryKey) != null;
	}
}