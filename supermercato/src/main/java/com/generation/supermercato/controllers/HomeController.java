package com.generation.supermercato.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.generation.supermercato.entities.Utente;

/*il codice implementa una funzionalità di homepage
 * che visualizza una vista differente in base all'utente
 * autenticato o meno all'interno dell'applicazione*/
@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home(HttpSession session, Model model)
	{
		model.addAttribute("utente",(Utente) session.getAttribute("utente"));
		if(model.getAttribute("utente") == null)
		{
			return "homelogin.jsp";
		}
		else
		{
			return "homelogout.jsp";
		}
	}
}