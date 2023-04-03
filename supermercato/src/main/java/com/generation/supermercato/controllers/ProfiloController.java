package com.generation.supermercato.controllers;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.generation.supermercato.dao.DaoProfilo;
import com.generation.supermercato.entities.Utente;

@Controller
@RequestMapping("/profilo")
public class ProfiloController {
	
	@Autowired
	public DaoProfilo dpr;
	
	@Autowired
	public ApplicationContext context;
	
	@GetMapping("/profilo")
	public String profilo(HttpSession session,Model model) {
		Utente u =(Utente)session.getAttribute("utente");
		int id=u.getId();
		model.addAttribute("storico", dpr.storico(id));
		model.addAttribute("utente", (Utente)session.getAttribute("utente"));
		return"/profilo/profilocliente.jsp";
	}
	/*Il codice rappresenta un metodo annotato con @PostMapping all'interno
	 * di un controller. Il metodo gestisce la richiesta POST sulla URL "/aggiornauser".
	 * Il metodo riceve in input il parametro nuovouser,
	 * che rappresenta il nuovo username inserito dall'utente,e l'oggetto HttpSession.
	 * Successivamente, il metodo recupera l'oggetto Utente dalla sessione e ne prende l'id.
	 * Successivamente, viene chiamato il metodo cambiaUser dell'oggetto dpr
	 * (un'istanza della classe DaoProfilo annotata con @Autowired)
	 * per aggiornare l'username dell'utente nel database.
	 * In conclusione, il metodo restituisce la vista /profilo/profilo,
	 * che rappresenta la pagina del profilo utente con i dati aggiornati.*/
	@PostMapping("/aggiornauser")
	public String aggiornaUser(@RequestParam("nuovouser") String nuovouser,HttpSession session) {
		Utente u =(Utente)session.getAttribute("utente");
		int id=u.getId();
		dpr.cambiaUser(nuovouser, id);
		return "/profilo/profilo";
	}
	
	@PostMapping("/aggiornapass")
	public String aggiornaPass(@RequestParam("nuovopass") String nuovopass, HttpSession session) {
		
		Utente u =(Utente)session.getAttribute("utente");
		int id=u.getId();
		dpr.cambiaPass(nuovopass, id);
		return "/profilo/profilo";
	}

	@PostMapping("/aggiornaemail")
	public String aggiornaEmail(@RequestParam("nuovoemail") String nuovoemail, HttpSession session) {
		
		Utente u =(Utente)session.getAttribute("utente");
		int id=u.getId();
		dpr.cambiaUser(nuovoemail, id);
		return "/profilo/profilo";
	}

	@PostMapping("/aggiornanominativo")
	public String aggiornaNominativo(@RequestParam("nuovonominativo") String nuovonominativo, HttpSession session) {
		
		Utente u =(Utente)session.getAttribute("utente");
		int id=u.getId();
		dpr.cambiaUser(nuovonominativo, id);
		return "/profilo/profilo";
	}
}