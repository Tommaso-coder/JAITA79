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
import com.generation.supermercato.dao.DaoUtenti;
import com.generation.supermercato.entities.Utente;

@Controller
@RequestMapping("/utenti")
public class UtentiController {
	
	@Autowired
	public DaoUtenti du;
	
	@Autowired
	public ApplicationContext context;
	
	@GetMapping("/formlogin")
	public String formlogin()
	{
		return "/utenti/formlogin.jsp";
	}
	@GetMapping("/formregistrazione")
    public String formregistrazione()
    {
        return "/utenti/formregistrazione.jsp";
    }
	/*Il codice rappresenta l'implementazione di una funzionalità di registrazione
	 * di un utente. Il metodo registrazione definisce la gestione della richiesta,
	 * riceve in input un oggetto HttpSession e un oggetto Map<String,String>
	 * contenente i parametri inviati tramite la form di registrazione.
	 * Il metodo verifica che i campi user, pass, e email siano stati inseriti
	 * correttamente e nel caso in cui uno di essi non rispetti i criteri
	 * (ad esempio, la password deve essere più lunga di 5 caratteri
	 * e l'email deve contenere uno dei domini specificati),
	 *  il metodo restituisce una vista di registrazione con un messaggio di errore.
	 *  In caso contrario, viene chiamato il metodo aggiungiUtente
	 *  (un'istanza della classe DaoUtente annotata con @Autowired)
	 *  per aggiungere l'utente al database.
	 *  Infine, il metodo restituisce la vista di login (/utenti/formlogin.jsp)
	 *  per l'utente appena registrato.*/
	@PostMapping("/registrazione")
    public String registrazione(@RequestParam Map<String,String> inputs, HttpSession session)
    {
        String user = "";
        String pass = "";
        String email = "";
        if(inputs.get("user").length()>1){
            user = inputs.get("user");
        }else {
            session.setAttribute("controllo", true);
            session.setAttribute("controlloOk", false);
              return "/utenti/formregistrazione.jsp";
        }
        if(inputs.get("pass").length()>5){
            pass = inputs.get("pass");
        }else {
            session.setAttribute("controllo", true); 
            session.setAttribute("controlloOk", false);
              return "/utenti/formregistrazione.jsp";
        }
        if(        (inputs.get("email").contains(".it")
            ||    inputs.get("email").contains(".com")
            ||    inputs.get("email").contains(".net"))){
            email = inputs.get("email");
        }else {
            session.setAttribute("controllo", true);
            session.setAttribute("controlloOk", false);
              return "/utenti/formregistrazione.jsp";
        }
            session.setAttribute("controlloOk", true);
            session.setAttribute("controllo", false);
     du.aggiungiUtente(user, pass, email);
        return "/utenti/formlogin.jsp";
    }

	//Questo mapping sfrutta il metodo caricaUtente per caricare cercare e caricare l'utente
	//nella SESSION e renderlo disponibile su ogni pagina.
	//Se non riesce va in nullpointer oppure in exception generica
	@GetMapping("/login")
	public String login(@RequestParam Map<String,String> inputs, HttpSession session)
	{
		String user = inputs.get("user");
		String pass = inputs.get("pass");
		try
		{
			Utente u = du.caricaUtente(user, pass);
			session.setAttribute("utente", u);
			return "redirect:/";
		}
		catch(NullPointerException e)
		{
			System.out.println("NullPointer su login");
			return "redirect:/formlogin";
		}
		catch(Exception e)
		{
			System.out.println("Exception su login");
			e.printStackTrace();
			return "/utenti/formlogin.jsp";
		}
	}
	/*Il metodo logout viene chiamato quando l'utente effettua
	 * il logout. Viene prima impostato l'attributo utente della
	 * sessione a null, per indicare che l'utente ha effettuato il logout.
	 * Viene infine effettuato un reindirizzamento alla URL "/",
	 * che rappresenta la homepage.*/
	@GetMapping("/logout")
	public String login(HttpSession session)
	{
		session.setAttribute("utente", null);
		return "redirect:/";
	}
	
	/*Il metodo invoca il metodo elencoUtenti dell'oggetto du (un'istanza della classe
	 * DaoUtente annotata con @Autowired) per recuperare un elenco di utenti dal database.
	 * Successivamente, l'elenco viene aggiunto come attributo dell'oggetto Model e
	 * viene restituita la vista elencoutenti.jsp, che visualizza l'elenco degli utenti.
	 * In sintesi, il codice implementa una funzionalità per visualizzare
	 * l'elenco degli utenti all'interno dell'applicazione*/
	@GetMapping("/elenco")
	public String elenco(Model model) {
		List<Map<String,String>> ris=du.elencoUtenti();
		model.addAttribute("elencoutenti", ris);
		return"/utenti/elencoutenti.jsp";
	}
	
	@GetMapping("/aggiornaruolo")
	public String aggiornaRuolo(@RequestParam("id") int id) {
		du.cambiaRuolo(id);
		return "/utenti/elenco";
	}
	
	/*Il metodo abbassaRuolo riceve in input il parametro id,
	 * che rappresenta l'id dell'utente da cui abbassare il ruolo.
	 * Viene poi chiamato il metodo declassaRuolo dell'oggetto du
	 * (un'istanza della classe DaoUtente annotata con @Autowired)
	 * per abbassare il ruolo dell'utente nel database.
	 * Infine, viene effettuato un reindirizzamento alla URL
	 * "/utenti/elenco", che rappresenta la pagina che visualizza
	 * l'elenco degli utenti.*/
	@GetMapping("/abbassaruolo")
	public String abbassaRuolo(@RequestParam("id") int id) {
		du.declassaRuolo(id);
		return "/utenti/elenco";
	}
}