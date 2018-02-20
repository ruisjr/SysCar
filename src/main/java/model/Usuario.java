package model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import controller.EntidadeBase;


@Entity
@Table(name="usuarios")
public class Usuario extends EntidadeBase {

	private long id;
	private String nome;
	private String senha;
	private Date ultimoLogin;
	private Date dataAlteracao;
	private int tipoUsuario;
	
	@Id
	public Long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}
	
	@Column(name="nome")
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@Column(name="senha")
	public String getSenha() {
		return senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	@Column(name="ultimoLogin")
	public Date getUltimoLogin() {
		return ultimoLogin;
	}
	
	public void setUltimoLogin(Date ultimoLogin) {
		this.ultimoLogin = ultimoLogin;
	}
	
	@Column(name="dataAlteracao")
	public Date getDataAlteracao() {
		return dataAlteracao;
	}
	
	public void setDataAlteracao(Date dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}
	
	@Column(name="tipoUsuario")
	public int getTipoUsuario() {
		return tipoUsuario;
	}
	
	public void setTipoUsuario(int tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}
	
	public Usuario() {
		
	}
	
	public Usuario(int id) {
		this.id = id;
	}		
}
