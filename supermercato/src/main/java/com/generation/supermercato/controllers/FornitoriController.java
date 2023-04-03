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
import org.springframework.web.bind.annotation.PostMapping;
import com.generation.supermercato.dao.DaoFornitori;

@Controller
@RequestMapping("/fornitori")
public class FornitoriController {
	
	/*l'oggetto DaoCarrello viene iniettato nell'oggetto df*/ 
	@Autowired
	public DaoFornitori df;
	
	/*l'oggetto ApplicationContext viene iniettato nell'oggetto context.*/
	@Autowired
	public ApplicationContext context;
	
	/*Il codice definisce un metodo elencoFornitori che riceve una richiesta
	 * HTTP tramite l'oggetto Model.  il metodo restituisce l'elenco dei fornitori
	 * che verrà visualizzato nel browser dell'utente.
	 */
	@GetMapping("/elencofornitori")
	public String elencoFornitori(Model model)
	{
		List<Map<String,String>> fornitori = df.fornitoriConNumeroProdotti();
		model.addAttribute("fornitori",fornitori);
		return "/fornitori/elencofornitori.jsp";
	}
	
	/*In sintesi, il metodo rappresenta l'implementazione di una
	 * funzionalità di ricerca di informazioni relative al fornitore e ai suoi prodotti.
	 * Le informazioni vengono recuperate utilizzando un oggetto DaoFornitore
	 * e vengono visualizzate in console. */
	@GetMapping("/cercafornitore")
	public String cercaFornitore(@RequestParam("id") int idFornitore, Model model)
	{
		Map<String,String> fornitore = df.cercaFornitorePerId(idFornitore);
		List<Map<String,String>> prodottifornitore = df.cercaProdottiFornitore(idFornitore);
		
		model.addAttribute("fornitore",fornitore);
		model.addAttribute("prodottifornitore",prodottifornitore);
		
		return "/fornitori/schedafornitore.jsp";
	}
	
	/*Il metodo formnuovofornitore viene chiamato quando si vuole visualizzare il
	 * form per l'inserimento di un nuovo fornitore.
	 * Viene aggiunto al model l'attributo mapcategoria, che rappresenta la mappa
	 * di tutte le categorie presenti nel database. Questo attributo verrà utilizzato
	 * nella form di inserimento del nuovo fornitore.
	 * Viene infine effettuato un reindirizzamento alla URL "/fornitori/formnuovofornitore.jsp"
	 *  che rappresenta la pagina che visualizza la form per l'inserimento di un nuovo fornitore.*/
	@GetMapping("formnuovofornitore")
	public String formnuovofornitore(Model model)
	{
		model.addAttribute("mapcategoria",df.leggiTutti());		
		return "/fornitori/formnuovofornitore.jsp";
	}
	
	/*il metodo rappresenta l'implementazione di una funzionalità per la creazione di
	 * un nuovo fornitore. Le informazioni sulle categorie vengono recuperate
	 * utilizzando un oggetto DaoFornitore e vengono visualizzate in console.*/
	@PostMapping("/aggiungifornitore")
    public String aggiungiFornitore(@RequestParam Map<String,String> inputs, HttpSession session,Model model)
    {
        String nome = inputs.get("nome");
        String email = inputs.get("email");
        String numero = inputs.get("numero");
        String pIVA = inputs.get("pIVA");
        System.out.println("----------------------" + nome + numero + email + pIVA);
        df.aggiungiFornitore(nome, email, numero, pIVA);
        List<Map<String,String>> fornitori = df.leggiTutti();
		model.addAttribute("fornitori",fornitori);
        return "/fornitori/elencofornitori.jsp";
    }
}