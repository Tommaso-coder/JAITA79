package com.generation.supermercato.controllers;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.generation.supermercato.dao.DaoCategoria;
import com.generation.supermercato.entities.Utente;

@Controller
@RequestMapping("/categoria")
public class CategoriaController {
	
	/*l'oggetto DaoCarrello viene iniettato nell'oggetto dc*/ 
	@Autowired
	public DaoCategoria dc;
	
	/*l'oggetto ApplicationContext viene iniettato nell'oggetto context.*/
	@Autowired
	public ApplicationContext context;
	
	/*Il codice rappresenta un metodo che gestisce una richiesta GET
	 * per cercare i prodotti associati a una determinata categoria.
	 * restituisce il nome della pagina, ovvero /categoria/schedacategoria.jsp,
	 * che verrà visualizzata nel browser dell'utente.
	 * Include anche la gestione di eventuali eccezioni e il reindirizzamento
	 * dell'utente a una pagina di login se non è autenticato.*/
	@GetMapping("/cercacategoria")
	public String cercaCategoria(@RequestParam("id") int idCategoria, Model model, HttpSession session)
	{
		try {
			model.addAttribute("utente", (Utente) session.getAttribute("utente"));
			try {
				Map<String,String> categoria = dc.cercaCategoriaPerId(idCategoria);
				List<Map<String,String>> prodotticategoria = dc.cercaProdottiCategoria(idCategoria);
				
				model.addAttribute("categoria",categoria);
				model.addAttribute("prodotticategoria",prodotticategoria);
				
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
		
		return "/categoria/schedacategoria.jsp";
	}
	
	/*Il codice definisce un metodo elencoCategoria che riceve una
	 * richiesta HTTP tramite l'oggetto Model e una sessione HTTP rappresentata da HttpSession.
	 * il metodo restituisce /categoria/elencocategorie.jsp, che verrà visualizzata
	 * nel browser dell'utente. Il codice include anche la gestione dell'oggetto
	 * utente passato come parametro nella sessione HTTP e la stampa di
	 * un messaggio di debug sulla console.*/
	@GetMapping("elencocategoria")
    public String elencoCategoria(Model model, HttpSession session)
    {
        model.addAttribute("utente", (Utente) session.getAttribute("utente"));
        List<Map<String, String>> ris = dc.leggiTutti();
        model.addAttribute("categoria",ris);
        System.out.println("avada kedavra!!!!!");
        return "/categoria/elencocategorie.jsp";
    }
}
