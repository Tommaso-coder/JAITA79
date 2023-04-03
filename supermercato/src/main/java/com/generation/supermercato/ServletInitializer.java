package com.generation.supermercato;

import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

/*Questo codice rappresenta una classe di configurazione
 * La classe ServletInitializer estende la classe SpringBootServletInitializer
 * e implementa il metodo configure, che viene utilizzato
 * per configurare l'applicazione Spring Boot. */
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SupermercatoApplication.class);
	}

}
