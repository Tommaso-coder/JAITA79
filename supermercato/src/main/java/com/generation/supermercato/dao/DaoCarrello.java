package com.generation.supermercato.dao;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import database.Database;


public class DaoCarrello 
{
	
	@Autowired
	public Database db;
	
	/*
	- rimuoviDalCarrello(int idRecord)
	- read(id Utente){
		return List<Map<String,String>>}
	- void compra(ArrayList<Integer>){
		change boolean carrello(query update su prodotto.disponibile)
	 */
	/*Il metodo rimuoviDalCarrello riceve in input l'id del prodotto
	 * da eliminare dal carrello dell'utente. Viene prima eseguita una
	 * query per recuperare la quantità del prodotto presente nel carrello
	 * dell'utente. Se la quantità del prodotto è maggiore di 1, viene eseguita
	 * una seconda query per aggiornare la quantità del prodotto nel carrello
	 * dell'utente. In caso contrario, viene eseguita una terza query per eliminare
	 * completamente il prodotto dal carrello dell'utente.
	 * Il metodo restituisce un messaggio di successo o di errore a seconda
	 * del risultato dell'operazione.*/
	public void rimuoviDalCarrello(int id)
    {
        String query2 = "select quantita from carrello where idProdotto=?;";
        boolean b=false;
        Map<String,String> m=db.row(query2, id+"");
        if((Integer.parseInt(m.get("quantita"))-1)>0) {
            String a="update carrello set quantita=? where idProdotto=?;";
            int quantita= Integer.parseInt(m.get("quantita"))-1;
            b=db.update(a, quantita+"",id+"");
        }else {
            String query = "delete from carrello where idProdotto = ?";
            b=db.update(query, id + "");
        }
        if(b==true)
            System.out.println("elemento eliminato");
        else
            System.out.println("errore nell'eliminazione");
    }
	
	
	/*Il metodo readCarrello riceve in input l'id dell'utente e restituisce una lista di
	 * mappe, dove ogni mappa rappresenta una riga della tabella carrello insieme alle
	 * informazioni del prodotto corrispondente dalla tabella prodotti. La query utilizzata
	 * seleziona tutte le colonne della tabella prodotti e la quantità del prodotto presente
	 * nel carrello dell'utente, calcolando il prezzo totale del prodotto in base alla quantità
	 * selezionata. Vengono selezionati solo i prodotti che non sono stati ancora acquistati
	 * dall'utente e raggruppati per id del prodotto nel carrello dell'utente.
	 * Il metodo compra riceve in input l'id dell'utente e aggiorna la tabella carrello
	 * impostando la colonna isAquistato a 1 per tutti i prodotti presenti nel carrello
	 * dell'utente. Ciò indica che i prodotti sono stati acquistati dall'utente.*/
	public List<Map<String,String>> readCarrello(int id)
	{	
		String query="select carrello.id as idcarrello,prodotti.*,carrello.quantita,\r\n"
				+ "(select if(carrello.quantita > 1 , sum(prodotti.prezzo*carrello.quantita) , prodotti.prezzo)) prezzototale\r\n"
				+ "from carrello inner join prodotti\r\n"
				+ "on idProdotto = prodotti.id\r\n"
				+ "where idUtente = ? and isAquistato = 0\r\n"
				+ "group by carrello.id;";
		return db.rows(query, id+"");
	}
	
	/*Il metodo compra riceve in input l'id dell'utente e aggiorna la tabella carrello impostando la
	 * colonna isAquistato a 1 per tutti i prodotti presenti nel carrello dell'utente.
	 * Ciò indica che i prodotti sono stati acquistati dall'utente. In altre parole, questo
	 * metodo viene chiamato quando l'utente conferma l'acquisto dei prodotti presenti
	 * nel carrello. L'aggiornamento della colonna isAquistato è importante per evitare
	 * che gli stessi prodotti siano acquistati più volte dallo stesso utente.*/
	public void compra(int idUtente)
	{
		String query="update carrello \r\n"
				+ "		set isAquistato=1\r\n"
				+ "		where idUtente=?;";
		db.update(query, idUtente+"");
		
	}
}