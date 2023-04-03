package com.generation.supermercato.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.generation.supermercato.dao.DaoCarrello;
import com.generation.supermercato.entities.Utente;


@Controller
@RequestMapping("/carrello")
public class CarrelloController 
{
	/*l'oggetto DaoCarrello viene iniettato nell'oggetto dc*/ 
	@Autowired
	public DaoCarrello dc;
	
	/*l'oggetto ApplicationContext viene iniettato nell'oggetto context.*/
	@Autowired
	public ApplicationContext context;
	
	/* metodo di un controller che utilizza l'oggetto dc
	 * per recuperare l'elenco dei prodotti presenti nel carrello
	 * dell'utente con l'id specificato. Poi l'elenco dei prodotti
	 * viene aggiunto all'oggetto Model e il metodo restituisce ciò
	 * che verrà visualizzato nel browser dell'utente.*/
	@GetMapping("carrelloprodotti")
	public String Carrello(@RequestParam("id") int id, HttpSession session, Model model)
	{
		List<Map<String,String>> ris= dc.readCarrello(id);
		System.out.println("Sono in carrello");
		model.addAttribute("utente", (Utente)session.getAttribute("utente"));
		model.addAttribute("elencocarrello", ris);
		return "/carrello/elencocarrello.jsp";
	}
	
	/*Il metodo utilizza l'oggetto dc per rimuovere un prodotto dal carrello
	 * dell'utente con l'id specificato, utilizzando l'id del prodotto
	 * passato come parametro. Successivamente, viene recuperato
	 * l'elenco aggiornato dei prodotti presenti nel carrello dell'utente*/
	@PostMapping("rimuovi")
    public String rimuovi(@RequestParam Map<String,String> inputs, HttpSession session, Model model)
    {
        dc.rimuoviDalCarrello(Integer.parseInt(inputs.get("idprodotto")));
        System.out.println("Sono in carrello");
        List<Map<String,String>> ris= dc.readCarrello(Integer.parseInt(inputs.get("id")));
        model.addAttribute("utente", (Utente)session.getAttribute("utente"));
        model.addAttribute("elencocarrello", ris);
        return "/carrello/elencocarrello.jsp";
    }
	/*il metodo rappresenta l'implementazione di una funzionalità
	 * di acquisto di prodotti dal carrello dell'utente*/
	@GetMapping("compraprodotti")
	public String compraCarrello(@RequestParam("id") int id)
	{
		dc.compra(id);
		return "redirect:/";
	}	
	
	/*Il metodo continuaAcquisto viene chiamato quando l'utente vuole
	 * procedere all'acquisto dei prodotti presenti nel carrello.
	 * Viene prima recuperato l'oggetto Utente dalla sessione e
	 * poi viene aggiunto come attributo al model.
	 * viene infine effettuato un reindirizzamento alla URL
	 * "/carrello/formacquisto.jsp", che rappresenta la pagina che
	 * visualizza il form per l'acquisto dei prodotti presenti nel carrello.*/
	@GetMapping("continuaacquisto")
	public String continuaAquisto (Model model, HttpSession session) {
		model.addAttribute("utente", (Utente)session.getAttribute("utente"));
		return "/carrello/formacquisto.jsp";
	}
}