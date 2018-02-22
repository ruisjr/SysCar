package controller;

import javax.persistence.EntityManager;

public class GenericDao<T extends EntidadeBase> {

	private static EntityManager manager = ConnectionFactory.getEntityManager();

	public T findById(Class<T> clazz, Long Id) {
		return manager.find(clazz, Id);
	}

	@SuppressWarnings("hiding")
	public <T> T save(T obj) {
		try {
			manager.getTransaction().begin();
			
			
			if (((EntidadeBase) obj).getId() == null || ((EntidadeBase) obj).getId() == 0 || ((EntidadeBase) obj).getId().equals(Long.parseLong("0"))) {
				manager.persist(obj);
			} else {
				manager.merge(obj);
			}

			manager.getTransaction().commit();
			return obj;
		} catch (Exception e) {
			manager.getTransaction().rollback();
			e.printStackTrace();
			throw e;
		}
	}

	public void remove(Class<T> clazz, Long id) {
		T obj = findById(clazz, id);

		try {
			manager.getTransaction().begin();
			manager.remove(obj);
			manager.persist(obj);
			manager.getTransaction().commit();
		} catch (Exception e) {
			manager.getTransaction().rollback();
		} finally {
			manager.close();
		}
	}
}
