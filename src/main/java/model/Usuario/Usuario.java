package model.Usuario;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.TableGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import controller.EntityBasic;

@Entity
@Table(name = "usuarios")
@TableGenerator(name = "tab", initialValue = 1, allocationSize = 1)
public class Usuario extends EntityBasic<Object> {

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE, generator = "tab")
	private long id;

	@Column(name = "nome")
	private String nome;

	@Column(name = "senha")
	private String senha;

	@Column(name = "ultimoLogin")
	@Temporal(TemporalType.TIMESTAMP)
	private Date ultimoLogin;

	@Column(name = "dataAlteracao")
	@Temporal(TemporalType.TIMESTAMP)
	private Date dataAlteracao;

	@Column(name = "tipoUsuario")
	private EnumeratorTipoUsuario tipoUsuario;

	public Long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Date getUltimoLogin() {
		return ultimoLogin;
	}

	public void setUltimoLogin(Date ultimoLogin) {
		this.ultimoLogin = ultimoLogin;
	}

	public Date getDataAlteracao() {
		return dataAlteracao;
	}

	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}

	public EnumeratorTipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}

	public void setTipoUsuario(EnumeratorTipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

	public Usuario() {
	}

	public Usuario(Long value) {
		id = value;
	}
}
