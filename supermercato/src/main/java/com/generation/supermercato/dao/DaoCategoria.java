package com.generation.supermercato.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import database.Database;

public class DaoCategoria {
	
	@Autowired
	public Database db;
	
	/* Il metodo read riceve in input una query SQL e un numero variabile di parametri.
	 * Il metodo utilizza la classe db per eseguire la query SQL con i parametri forniti
	 * e restituire una lista di mappe, dove ogni mappa rappresenta una riga della tabella
	 * restituita dalla query. Ogni mappa contiene coppie chiave-valore, dove la chiave
	 * rappresenta il nome della colonna e il valore rappresenta il valore della colonna per la riga corrente.*/
	public List<Map<String, String>> read(String query, String... param) {
		return db.rows(query, param);
	}
	/* Il metodo leggiTutti esegue una query SQL per selezionare tutte le righe e tutte le
	 * colonne della tabella categoria dal database. Il metodo restituisce
	 * una lista di mappe, dove ogni mappa rappresenta una riga della tabella categoria.
	 * Ogni mappa contiene coppie chiave-valore, dove la chiave rappresenta il nome
	 * della colonna e il valore rappresenta il valore della colonna per la riga corrente.*/
	public List<Map<String, String>> leggiTutti() {
		return db.rows("select * from categoria");
	}
	/* Il metodo cercaCategoriaPerId riceve in input l'id di una categoria e restituisce
	 * una mappa contenente tutte le informazioni della categoria corrispondente. */
	  	public Map<String, String> cercaCategoriaPerId(int id) {
	 
		String query = "select * from categoria where categoria.id = ?;";
		return db.row(query, id + "");
	}
	  	
	/*Il metodo cercaProdottiCategoria riceve in input l'id di una categoria e restituisce una
	 * lista di mappe contenente informazioni sui prodotti appartenenti a tale categoria. */
	public List<Map<String, String>> cercaProdottiCategoria(int idCategoria) {
		String query = "select categoria.id, categoria.nomecategoria, prodotti.id as idProdotto, prodotti.nome, prodotti.prezzo, prodotti.idcategoria, prodotti.idfornitori, prodotti.URLImmagine, fornitori.id, fornitori.nomefornitori\r\n"
				+ " from categoria inner join prodotti on categoria.id = prodotti.idcategoria\r\n"
				+ "	inner join fornitori on prodotti.idfornitori = fornitori.id where categoria.id =?;";
		return db.rows(query, idCategoria + "");
	}

}
