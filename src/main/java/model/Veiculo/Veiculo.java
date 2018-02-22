package model.Veiculo;

import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import controller.EntidadeBase;

@Entity
@Table(name = "veiculos")
@TableGenerator(name = "tab", initialValue = 1, allocationSize = 1)
public class Veiculo extends EntidadeBase {

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "tab")
	private Long id;

	@Column(name = "nome")
	private String nome;

	@Column(name = "tipo")
	private EnumTipoVeiculo tipoVeiculo;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "modelo_id", referencedColumnName="id")
	private ModeloVeiculo modelo;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "marca_id", referencedColumnName="id")
	private MarcaVeiculo marca;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "cor_id", referencedColumnName="id")
	private Cor cor;

	@Column(name = "valor")
	private BigDecimal valor;

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

	public EnumTipoVeiculo getTipoVeiculo() {
		return tipoVeiculo;
	}

	public void setTipoVeiculo(EnumTipoVeiculo value) {
		this.tipoVeiculo = value;
	}

	public ModeloVeiculo getModelo() {
		return modelo;
	}

	public void setModelo(ModeloVeiculo value) {
		this.modelo = value;
	}

	public MarcaVeiculo getMarca() {
		return marca;
	}

	public void setMarca(MarcaVeiculo value) {
		this.marca = value;
	}

	public Cor getCor() {
		return cor;
	}

	public void setCor(Cor value) {
		this.cor = value;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal value) {
		this.valor = value;
	}
}
