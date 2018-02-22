package model.Veiculo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import controller.EntidadeBase;

@Entity
@Table(name = "cores")
@TableGenerator(name = "tabCores", initialValue = 1, allocationSize = 1)
public class Cor extends EntidadeBase {

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "tabCores")
	private Long id;

	@Column(name = "nome")
	private String nome;

	public Long getId() {
		return id;
	}

	public void setId(Long value) {
		this.id = value;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String value) {
		this.nome = value;
	}

}
