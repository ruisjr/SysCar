package controller;

import javax.persistence.EntityManager;

public class GenericDao<T extends EntidadeBase> {
	
	private static EntityManager manager = ConnectionFactory.getEntityManager();
	
	public T findById(Class<T> clazz, Long Id) {
		return manager.find(clazz, Id);
	}
	
	public void save(T obj) {
		manager.getTransaction().begin();
		try {
			if (obj.getId() == 0 || obj.getId().equals(0)) {
				manager.persist(obj);
			} else {
				manager.merge(obj);
			}
			
			manager.getTransaction().commit();
		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		} finally {
			manager.close();
		}
	}
	
	public void remove(Long id) {
		@SuppressWarnings("unchecked")
		T obj = findById((Class<T>) this.getClass(), id);

		manager.getTransaction().begin();
		try {
			manager.remove(obj);
			manager.persist(obj);
			manager.getTransaction().commit();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}
	
	public void remove(Class<T> clazz, Long id) {
		T obj = findById(clazz, id);
		
		try {
			manager.remove(obj);
			manager.persist(obj);
			manager.getTransaction().commit();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		}
	}	
}
