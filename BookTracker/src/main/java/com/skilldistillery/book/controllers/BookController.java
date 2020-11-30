package com.skilldistillery.book.controllers;

import java.net.http.HttpResponse;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.book.entities.Book;
import com.skilldistillery.book.repositories.BookRepository;
import com.skilldistillery.book.services.BookService;
@CrossOrigin({"*", "http://localhost:4205"})
@RequestMapping("api")
@RestController
public class BookController {

	@Autowired
	private BookService bookSvc;

	@GetMapping("books")
	public List<Book> findAllBooks(HttpServletResponse resp) {
		List<Book> books = bookSvc.getAllBooks();
		if (books == null) {
			resp.setStatus(404);
		}
		return books;
	}

	@GetMapping("books/{id}")
	public Book findByid(@PathVariable Integer id, HttpServletResponse resp) {
		Book book = bookSvc.findById(id);
		if (book == null) {
			resp.setStatus(404);
		}
		return book;
	}

	@PutMapping("books/{id}")
	public Book updateBook(@PathVariable Integer id, @RequestBody Book book, HttpServletResponse resp) {
		try {
			book = bookSvc.updateBook(id, book);
			if (book == null) {
				resp.setStatus(404);
				book = null;
			}
		} catch (Exception e) {
			resp.setStatus(400);
			book = null;
		}
		return book;
	}

	@PostMapping("books")
	public Book createBook(@RequestBody Book book) {
		book = bookSvc.createBook(book);
		return book;
	}

	@DeleteMapping("books/{id}")
	public void deleteBook(@PathVariable Integer id, HttpServletResponse resp) {
		if (bookSvc.deleteBook(id)) {
			resp.setStatus(204);
		} else {
			resp.setStatus(404);
		}
	}

}