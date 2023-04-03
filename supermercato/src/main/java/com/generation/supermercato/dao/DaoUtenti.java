package com.generation.supermercato.dao;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.generation.supermercato.entities.Utente;

import database.Database;

public class DaoUtenti
{
	@Autowired
	public Database db;
	
	@Autowired
	public ApplicationContext context;
	
	/**
	 * caricaUtente fa una ricerca dell'utente sul DB in base a username e password.
	 * Se trova l'utente lo trasforma in un oggetto UTENTE con ID, USER, PASS e RUOLO.
	 * @param user
	 * @param pass
	 * @return Utente u
	 * Exception -> nullPointerException perché l'utente potrebbe essere null in caso non sia
	 * presente sul DB.
	 */
	public Utente caricaUtente(String user, String pass)
	{
		Utente u = null;
		String query = 	"select * from utenti where user = ? and pass = ?";
		Map<String,String> m = db.row(query, user, pass);
		if(m != null)
		{
			int id = Integer.parseInt(m.get("id"));
			switch(m.get("ruolo").toLowerCase())
			{
				case "admin"	:
					u = (Utente) context.getBean(	"utenteid",id, m.get("user"), m.get("pass"),m.get("email"), m.get("ruolo"));
				break;
				case "lavoratore"	:
					u = (Utente) context.getBean(	"utenteid",id, m.get("user"), m.get("pass"),m.get("email"), m.get("ruolo"));
				break;
				case "cliente"	:
					u = (Utente) context.getBean(	"utenteid",id, m.get("user"), m.get("pass"),m.get("email"), m.get("ruolo"));
				break;
			}
		}
		return u;
	}
	
	/**aggiungiUtente esegue una query di insert con i parametri inseriti nel form registrazione*/
	public void aggiungiUtente(String user, String pass, String email) {
        String query = "INSERT INTO utenti (user, pass, email, ruolo) VALUES (?, ?, ?, ?)";
        db.update(query, user, pass, email, "cliente");
    }
	
	/** elencoUtenti ritorna una lista di mappe String,String inizializzate dalla lettura della tabbella utenti del db
	 * avremo quindi una coppia di String per ogni colonna della tabella*/
	public List<Map<String,String>> elencoUtenti(){
		String query="select * from utenti;";
		return db.rows(query);
	}
	
	/** cambiaRuolo è un metodo che esegue una semplice query di update preceduta dauna query di select che inizializza una mappa
	 * con la riga della tabella risultante in base all'id passato la mappa servirà per creare l'utente a cui faremo l'update ruolo in admin*/
	public void cambiaRuolo( int id) {
		String query ="select * from utenti where id=?";
		Map<String,String> ris =db.row(query, id+"");
		Utente u=new Utente(0,  null, null, null, null);
		u=(Utente) u.fromMap(ris);
		String query2="update utenti set user=?,pass=?,email=?,ruolo='admin',nominativo=? where id=?;";
		db.update(query2,u.getUser(),u.getPass(),u.getEmail(),u.getId()+"");
	}
	/** declassaRuolo è un metodo che esegue una semplice query di update preceduta dauna query di select che inizializza una mappa
	 * con la riga della tabella risultante in base all'id passato la mappa servirà per creare l'utente a cui faremo l'update ruolo in cliente*/
	public void declassaRuolo(int id) {
		String query ="select * from utenti where id=?";
		Map<String,String> ris =db.row(query, id+"");
		Utente u=new Utente(0, null, null, null, null);
		u=(Utente) u.fromMap(ris);
		String query2="update utenti set user=?,pass=?,email=?,ruolo='cliente',nominativo=? where id=?;";
		db.update(query2,u.getUser(),u.getPass(),u.getEmail(),u.getId()+"");
	}
}