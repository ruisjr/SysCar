package controller;

import javax.persistence.Column;
import javax.persistence.Id;

@SuppressWarnings("rawtypes")
public class EntidadeBase extends GenericDao {

	private Long id;

	@Id
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	@SuppressWarnings("unchecked")
	public void save() {
		super.save(this);
	}

	@SuppressWarnings("unchecked")
	public void remove() {
		super.remove(this.getClass(), this.getId());
	}

	@SuppressWarnings("unchecked")
	public void remove(Long id) {
		super.remove(this.getClass(), this.getId());
	}

	@SuppressWarnings("unchecked")
	public void findById() {
		super.findById(this.getClass(), this.getId());
	}
}
