package com.generation.supermercato.dao;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import database.Database;

public class DaoProfilo {
	
	@Autowired
	public Database db;

	/**cambiaUser esegue una semplice query di update del valore della colonna user per la riga richiamata tramite l'id*/
	public void cambiaUser(String nuovouser, int id) {
		String query="update utenti set user=? where id=?;";
		db.update(query, nuovouser,id+"");
	}
	
	/**cambiaPass esegue una semplice query di update del valore della colonna pass per la riga richiamata tramite l'id*/
	public void cambiaPass(String nuovopass, int id) {
		String query="update utenti set pass=? where id=?;";
		db.update(query, nuovopass,id+"");
	}
	
	/**cambiaEmail esegue una semplice query di update del valore della colonna email per la riga richiamata tramite l'id*/
	public void cambiaEmail(String nuovoemail, int id) {
		String query="update utenti set email=? where id=?;";
		db.update(query,nuovoemail, id+"");
	}
	
	/** risorna una lista di mappe inizializzate dalla tabella risultante alla query che ci darà le seguenti colonne:
	 * nome, 
	 * quantita(risultato di una query interna che gestisce la somma di eventuali record con lo stesso idProdotto), 
	 * prezzototale ()risultato di una moltipicazione tra il prezzo e la quantita risultante dalla subquery*/
	public List<Map<String,String>> storico(int id){
		String query="select distinct prodotti.nome as nome, c.totquantita as quantita, (prodotti.prezzo*c.totquantita) as prezzototale\r\n"
				+ "	from carrello inner join\r\n"
				+ "    (select sum(carrello.quantita) as totquantita , carrello.idProdotto as id\r\n"
				+ "	from carrello\r\n"
				+ "	group by idProdotto) as c\r\n"
				+ "    on carrello.idProdotto =c.id\r\n"
				+ "    inner join prodotti\r\n"
				+ "	on carrello.idProdotto=prodotti.id\r\n"
				+ "	where idUtente=?;";
		List<Map<String,String>> storico=db.rows(query, id+"");
		return storico;
	}
}
