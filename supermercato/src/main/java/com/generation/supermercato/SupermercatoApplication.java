package com.generation.supermercato;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/*Il metodo main è il punto di ingresso dell'applicazione
 * e viene utilizzato per avviare l'applicazione Spring Boot
 * utilizzando il metodo run di SpringApplication.
 * questo codice quindi avvia l'applicazione Spring Boot
 * per il progetto e la rende disponibile per l'utilizzo.*/

@SpringBootApplication
public class SupermercatoApplication {

	public static void main(String[] args) {
		SpringApplication.run(SupermercatoApplication.class, args);
	}

}
