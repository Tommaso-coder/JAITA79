package com.generation.supermercato.entities;

import entities.Entity;

/*Il codice rappresenta la definizione della classe
 * Utente che estende la classe Entity. La classe Utente ha
 * quattro campi dati privati: user, pass, email e ruolo.
 * Il costruttore della classe prende in input un id, un nome
 * utente, una password, un indirizzo email e un ruolo, e
 * inizializza i campi dati corrispondenti. La classe contiene
 * inoltre quattro metodi getter e quattro metodi setter per i
 * campi dati user, pass, email, e ruolo. I metodi getter restituiscono
 * il valore del campo dati corrispondente, mentre i metodi setter
 * impostano il valore del campo dati corrispondente. La classe Utente
 * è utilizzata per rappresentare un utente del sistema di un supermercato,
 * con un id, un nome utente, una password, un indirizzo email e un ruolo.*/
public class Utente extends Entity
{
	private String user;
	private String pass;
	private String email;
	private String ruolo;
	
	
	public Utente(int id, String user, String pass, String email, String ruolo)
	{
		super(id);
		this.user = user;
		this.pass = pass;
		this.email=email;
		this.ruolo = ruolo;
	}
	

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUser()
	{
		return user;
	}
	
	public void setUser(String user)
	{
		this.user = user;
	}
	
	public String getPass()
	{
		return pass;
	}
	
	public void setPass(String pass)
	{
		this.pass = pass;
	}
	
	public String getRuolo()
	{
		return ruolo;
	}
	
	public void setRuolo(String ruolo)
	{
		this.ruolo = ruolo;
	}	
}