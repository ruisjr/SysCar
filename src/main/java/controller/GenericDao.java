package controller;

import javax.persistence.EntityManager;

public class GenericDao<T extends EntidadeBase> {
	
	private static EntityManager manager = ConnectionFactory.getEntityManager();
	
	public T findById(Class<T> clazz, Long Id) {
		return manager.find(clazz, Id);
	}
	
	public void save(T obj) {
		try {
			manager.getTransaction().begin();
			
			if (obj.getId() == null) {
				manager.persist(obj);
			} else {
				manager.merge(obj);
			}
			
			manager.getTransaction().commit();				
		} catch (Exception e) {
			manager.getTransaction().rollback();
			throw e;
		}
	}
	
	public void remove(Class<T> clazz, Long id) {
		T t = findById(clazz, id);
		
		try {
			manager.getTransaction().begin();
			manager.remove(t);
			manager.getTransaction().commit();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		}
	}

}
