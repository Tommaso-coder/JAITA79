package com.generation.supermercato;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import com.generation.supermercato.dao.DaoProfilo;
import com.generation.supermercato.dao.DaoCarrello;
import com.generation.supermercato.dao.DaoCategoria;
import com.generation.supermercato.dao.DaoFornitori;
import com.generation.supermercato.dao.DaoProdotti;
import com.generation.supermercato.dao.DaoUtenti;
import com.generation.supermercato.entities.Utente;

import database.Database;

/*Il codice rappresenta una classe di configurazione di Spring che
 * definisce diversi bean utilizzati dall'applicazione.
 * La classe è annotata con @Configuration, che indica a
 * Spring che contiene metodi che definiscono bean.*/
@Configuration
public class Context {
	
	@Bean
	public Database db()
	{
		return new Database("alimentari");
	}
	
	@Bean
	public DaoProdotti dp()
	{
		return new DaoProdotti();
	}
	
	@Bean
	public DaoCategoria dc() {
		return new DaoCategoria();
	}
	
	@Bean
	public DaoFornitori df() {
		return new DaoFornitori();
	}
	
	@Bean
	public DaoUtenti du() {
		return new DaoUtenti();
	}
	
	@Bean
	public DaoCarrello dca() {
		return new DaoCarrello();
	}
	
	@Bean
	public DaoProfilo dpr() {
		return new DaoProfilo();
	}

	@Bean
	@Scope("prototype")
	public Utente utenteid(	int id, String user, String pass, String email,
							String ruolo)
	{
		return new Utente(id,user,pass,email,ruolo);
	}

}
