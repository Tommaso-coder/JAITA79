package com.generation.supermercato.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.supermercato.dao.DaoCategoria;
import com.generation.supermercato.dao.DaoFornitori;
import com.generation.supermercato.dao.DaoProdotti;
import com.generation.supermercato.entities.Utente;

@Controller
@RequestMapping("/prodotti")
public class ProdottiController {
	
	
	@Autowired
	public DaoProdotti dp;
	
	@Autowired
	public DaoCategoria dc;
	
	@Autowired
	public DaoFornitori df;
	
	@Autowired
	public ApplicationContext context;
	
	/*Il codice rappresenta un metodo annotato con @GetMapping all'interno
	 * di un controller. Il metodo gestisce la richiesta GET sulla URL "/elencoprodotti",
	 * recupera l'oggetto HttpSession e l'attributo "utente",che viene
	 * poi aggiunto come attributo dell'oggetto Model.
	 * Successivamente, viene chiamato il metodo leggiTutti dell'oggetto dp
	 * (un'istanza della classe DaoProdotto annotata con @Autowired)
	 * per recuperare un elenco di prodotti dal database,
	 * che viene poi aggiunto come attributo dell'oggetto Model.
	 * In caso di eccezioni, viene visualizzato un messaggio di errore
	 * e l'utente viene reindirizzato alla homepage o alla pagina di login,
	 * a seconda del tipo di eccezione.Infine, viene restituito /prodotti/elencoprodotti.jsp,
	 * che visualizza l'elenco dei prodotti all'interno dell'applicazione.*/
	@GetMapping("elencoprodotti")
	public String elenco(Model model, HttpSession session)
	{
		try {
			model.addAttribute("utente", (Utente) session.getAttribute("utente"));
			try {
				List<Map<String, String>> ris = dp.leggiTutti();
				model.addAttribute("prodotti",ris);
				}catch(Exception e)  {
					e.printStackTrace();
					System.out.println("Sono nel catch 1 di elencoprodotti");
					return "redirect:/";
				}
		}catch(NullPointerException e) {
			return "redirect:/utenti/login";
		}catch(Exception e)  {
			e.printStackTrace();
			System.out.println("Sono nel catch 2 di elencoprodotti");
			return "redirect:/";
		}
		return "/prodotti/elencoprodotti.jsp";
	}
	
	/* rappresenta un metodo annotato con @GetMapping all'interno
	 * di un controller che gestisce la richiesta GET sulla URL "/elimina" e
	 * riceve in input il parametro idElimina, che rappresenta l'id del prodotto da eliminare.
	 * Successivamente, viene chiamato il metodo delete dell'oggetto dp
	 * (un'istanza della classe DaoProdotto annotata con @Autowired)
	 * per eliminare il prodotto dal database.
	 * In base al risultato dell'operazione di eliminazione,
	 * viene restituito un messaggio di successo o di errore.
	 * Infine, viene effettuato un reindirizzamento alla URL "/elencoprodotti"*/
	@GetMapping("elimina")
	public String elimina(@RequestParam("id") int idElimina)
	{
		String ris = "";
		if(dp.delete(idElimina))
			ris = "Eliminazione avvenuta con successo";
		else
			ris = "Errore nell'eliminazione del prodotto con id = " + idElimina;
		System.out.println(ris);
		return "redirect:elencoprodotti";
	}
	
	@GetMapping("formmodifica")
	public String formmodifica(@RequestParam("id") int idModifica, Model model)
	{
		model.addAttribute("daModificare",dp.cercaPerId(idModifica));
		System.out.println(dp.cercaPerId(idModifica));
		model.addAttribute("mapcategoria",dc.leggiTutti());
		model.addAttribute("mapfornitori",df.leggiTutti());
		return "/prodotti/formmodifica.jsp";
	}
	
	/* rappresenta un metodo annotato con @GetMapping all'interno
	 * di un controller che gestisce la richiesta GET sulla URL "/modificaprodotto".
	 * Il metodo riceve in input un oggetto Map<String, String>
	 * che rappresenta i parametri della richiesta.
	 * Successivamente, vengono recuperati i valori dei parametri "nome" e "prezzo",
	 * viene poi verificata la correttezza dei valori ricevuti,
	 * ovvero che il nome abbia almeno 2 caratteri e che il prezzo sia un
	 * numero maggiore di zero. In caso contrario, non viene effettuata alcuna modifica.
	 * Se i valori sono corretti, viene chiamato il metodo update dell'oggetto dp
	 * (un'istanza della classe DaoProdotto annotata con @Autowired)
	 * per modificare il prodotto nel database.
	 * Infine, viene effettuato un reindirizzamento alla URL "/prodotti/elencoprodotti".*/
	@GetMapping("modificaprodotto")
	public String modifica(@RequestParam Map<String,String> inputs)
	{
		String nome=inputs.get("nome");
		String prezzo =inputs.get("prezzo");
		if(nome.length()>1&&Double.parseDouble(prezzo)>0) {
			dp.update(inputs);
		}
		return "redirect:/prodotti/elencoprodotti";
	}
	
	@GetMapping("formnuovoprodotto")
	public String formnuovoprodotto(Model model)
	{
		model.addAttribute("mapcategoria",dc.leggiTutti());
		model.addAttribute("mapfornitori",df.leggiTutti());
		return "/prodotti/formnuovoprodotto.jsp";
	}
	
	/* Il metodo riceve come parametro una mappa di stringhe
	 * inputs, che rappresenta i dati del nuovo prodotto da inserire nel database.
	 * Successivamente, vengono estratti il nome e il prezzo del nuovo prodotto
	 * dalla mappa di stringhe. Viene poi verificata la correttezza dei
	 * valori ricevuti, ovvero che il nome abbia almeno 2 caratteri
	 * e che il prezzo sia un numero maggiore di zero.
	 * In caso contrario, non viene effettuata alcuna inserzione.
	 * Se i valori sono corretti, viene chiamato il metodo create dell'oggetto dp
	 * (un'istanza della classe DaoProdotto annotata con @Autowired)
	 * per inserire il nuovo prodotto nel database. Se l'inserimento va a
	 *  buon fine, viene chiamato il metodo update per aggiornare la lista dei prodotti.
	 *  Infine, viene effettuato un reindirizzamento alla URL "/elencoprodotti".*/
	@GetMapping("nuovoprodotto")
	public String nuovoprodotto(@RequestParam Map<String,String> inputs)
	{

		String nome=inputs.get("nome");
		String prezzo =inputs.get("prezzo");
		if(nome.length()>1&&Double.parseDouble(prezzo)>0) {
			if(dp.create(inputs))dp.update(inputs);
		}
		return "redirect:elencoprodotti";
	}
	
	/*Il metodo riceve in input il parametro idProdotto,che rappresenta l'id del prodotto
	 * da aggiungere al carrello. Viene poi recuperato l'oggetto Utente dalla sessione
	 * e viene chiamato il metodo aggiungiCarrello dell'oggetto dp (un'istanza della
	 * classe DaoProdotto annotata con @Autowired) per aggiungere il prodotto al
	 * carrello dell'utente. Se l'operazione va a buon fine, viene effettuato un
	 * reindirizzamento alla URL "/prodotti/elencoprodotti", che rappresenta la pagina
	 * che visualizza l'elenco dei prodotti. Se l'utente non è presente nella sessione
	 * o si verifica un'eccezione, viene restituito un messaggio di errore.*/
	@GetMapping("/aggiungicarrello")
	public String aggiungiCarrello(@RequestParam("id") String idProdotto,HttpSession session){		
		try{
			Utente u=(Utente) (session.getAttribute("utente"));
			dp.aggiungiCarrello(idProdotto, u.getId()+"");		
			return"redirect:/prodotti/elencoprodotti";
		}
		catch(NullPointerException e){
			return "Errore dell'utente nella session";
		}
		catch(Exception e){
			e.printStackTrace();
			System.out.println("Sono nel catch di Prodotticontroller.aggiungiCarrello()");
		}
		return"redirect:/prodotti/elencoprodotti";
	}
}