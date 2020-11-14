package com.skilldistillery.book.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.book.services.BookService;

@RequestMapping("api")
@RestController
public class BookController {

	@Autowired
	private BookService bookSvc;
	
	@GetMapping("ping")
	public String ping() {
		return "pong mother fucker";
	}
}
