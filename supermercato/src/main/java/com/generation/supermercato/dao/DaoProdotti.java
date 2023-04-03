package com.generation.supermercato.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import database.Database;

public class DaoProdotti {
	
	@Autowired
	public Database db;
	
	public List<Map<String,String>> read(String query, String... params)
	{
		return db.rows(query, params);
	}
	
	public List<Map<String,String>> leggiTutti()
    {
        return db.rows("select    prodotti.id as id,    prodotti.nome as nome, \r\n"
                + "prodotti.prezzo as prezzo, categoria.nomecategoria as categoria, categoria.id as idcategoria, \r\n"
                + "fornitori.nomefornitori as fornitore, prodotti.URLImmagine as URLImmagine,fornitori.id as idfornitore\r\n"
                + "from prodotti inner join categoria on prodotti.idcategoria = categoria.id \r\n"
                + "inner join fornitori  on prodotti.idfornitori = fornitori.id order by prodotti.id;");
    }
	
	/* metodo che cancella un prodotto tramite id*/
	public boolean delete(int id)
	{
		String query = "delete from prodotti where id = ?";
		return db.update(query, id + "");
	}
	
	/*Il metodo esegue una query SQL per inserire un nuovo prodotto nella tabella prodotti del database,
	 * utilizzando i valori della mappa come parametri per la query. La query viene eseguita utilizzando
	 * la classe db per accedere al database.*/
	public boolean create(Map<String,String> m)
	{
		String query = "insert into prodotti (nome,prezzo,idcategoria,idfornitori,URLImmagine) values (?,?,?,?,?)";
		return db.update(query, m.get("nome"), m.get("prezzo"), m.get("idcategoria"), m.get("idfornitori"), m.get("URLImmagine"));
	}
	/*Il metodo update riceve in input una mappa di valori che rappresenta le nuove informazioni di un prodotto e
	 * aggiorna la riga corrispondente nella tabella prodotti del database e restituisce un valore booleano che
	 * indica se l'operazione di aggiornamento ha avuto successo o meno.*/
	public boolean update(Map<String,String> m)
	{
		String query = "update prodotti set nome = ?, prezzo = ?, idcategoria = ?, idfornitori = ?, URLImmagine = ? where id = ?";
		return db.update(query, m.get("nome"), m.get("prezzo"), m.get("idcategoria"),m.get("idfornitori"),m.get("URLImmagine"), m.get("id"));
	}
	
	/*Il metodo cercaPerId riceve in input l'id di un prodotto e restituisce una mappa contenente
	 * tutte le informazioni del prodotto corrispondente. */
	public Map<String, String> cercaPerId(int id)
	{
		String query = "select    prodotti.id as idprodotti, prodotti.nome as nomeprodotto, \r\n"
                + "prodotti.prezzo as prezzoprodotto,\r\n"
                + "prodotti.idcategoria as idcategoria, prodotti.URLImmagine as URLImmagine, \r\n"
                + "categoria.nomecategoria as categoria, \r\n"
                + "prodotti.idfornitori as idfornitori,\r\n"
                + "fornitori.nomefornitori as fornitore \r\n"
                + "from prodotti inner join categoria \r\n"
                + "on prodotti.idcategoria = categoria.id \r\n"
                + "inner join fornitori on prodotti.idfornitori = fornitori.id \r\n"
                + "where     prodotti.id = ?;";
		return db.row(query, id + "");
	}
	
	/*Il codice definisce un metodo chiamato aggiungiCarrello che riceve in input l'id
	 * di un prodotto e l'id di un utente, e aggiunge il prodotto al carrello dell'utente.*/
	public void aggiungiCarrello(String idProdotto, String idUtente) {
		String query1 = "select carrello.id, carrello.quantita\r\n"
					+ "from carrello\r\n"
					+ "where carrello.idProdotto = ?\r\n"
					+ "and carrello.idUtente = ?"
					+ "and carrello.isAquistato=0;";
		Map<String, String> c = db.row(query1, idProdotto,idUtente);
		System.out.println(c);
		if(c == null) {
			String query = "insert into carrello(isAquistato, idUtente, idProdotto, quantita) values(0,?,?,?)";
			System.out.println("sono nell'if di aggiungi carrello " + db.update(query,idUtente,idProdotto,1+"")); 
			System.out.println("sono nell'if di aggiungi carrello " + query);
		}
		else {
			String id = c.get("id");
			int quantita = 0;
			try {
				quantita = Integer.parseInt(c.get("quantita"));
				quantita++;
			}catch(NumberFormatException e) {
				e.printStackTrace();
				quantita = 1;
			}
			
			String query = "update carrello set quantita = ? where id = ?;";
			System.out.println("sono nell'ultimo update del metodo aggiungi carrello " + db.update(query, quantita + "",id)); 
			System.out.println("sono nell'ultimo update del metodo aggiungi carrello " + query);
		}
	}
}