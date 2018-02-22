package controller;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ConnectionFactory {

	private static String entityName = "";
	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory(entityName);

	public static void setEntityName(String value) {
		ConnectionFactory.entityName = value;
	}

	public static EntityManager getEntityManager() {
		return factory.createEntityManager();
	}

}
