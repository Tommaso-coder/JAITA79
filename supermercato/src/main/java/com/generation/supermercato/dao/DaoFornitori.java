package com.generation.supermercato.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import database.Database;

public class DaoFornitori {
	
	@Autowired
	public Database db;
	
	public List<Map<String, String>> read(String query,String...params) {
		return db.rows(query, params);
	}
	
	public List<Map<String, String>> leggiTutti() {
		return db.rows("select * from fornitori");
	}
	/*Il metodo fornitoriConNumeroProdotti restituisce una lista di
	 * mappe contenenti informazioni sui fornitori e il numero di prodotti
	 * che ogni fornitore ha nel database.*/
	public List<Map<String, String>> fornitoriConNumeroProdotti() {
		String query = "SELECT fornitori.id, fornitori.email,fornitori.numero,fornitori.pIVA, fornitori.nomefornitori, count(prodotti.id) AS nProdotti\r\n"
				+ "FROM fornitori LEFT JOIN prodotti ON fornitori.id = prodotti.idfornitori \r\n"
				+ "GROUP BY fornitori.id;";
		return db.rows(query);
	}
	
	/* Query che ricerca il fornitore tramite id*/
	public Map<String,String> cercaFornitorePerId(int id)
	{
		String query = 	"select	* from fornitori where fornitori.id = ?;";
		return db.row(query, id + "");
	}
	/*cerca tutti i prodotti appartenenti a un determinato fornitore. La query seleziona tutte le colonne della
	 * tabella fornitori, prodotti e categoria dove l'id del fornitore corrisponde con quello passato come parametro al metodo.*/
	public List<Map<String,String>> cercaProdottiFornitore(int idFornitore)
	{
		String query = 	"select * from fornitori inner join prodotti on fornitori.id = prodotti.idfornitori\r\n"
				+ "inner join categoria on prodotti.idcategoria = categoria.id where fornitori.id = ?;";
		return db.rows(query, idFornitore + "");
	}
	/*aggiunge un nuovo fornitore alla tabella fornitori del database. La query esegue un'operazione di inserimento
	 * di una nuova riga nella tabella contenente le informazioni del nuovo fornitore. */
	public void aggiungiFornitore(String nomefornitore, String email, String numero, String pIVA) {
        String query = "insert into fornitori (nomefornitori, email, numero, pIVA) values (?, ?, ?, ?)";
        db.update(query, nomefornitore, email, numero, pIVA);
    }
}