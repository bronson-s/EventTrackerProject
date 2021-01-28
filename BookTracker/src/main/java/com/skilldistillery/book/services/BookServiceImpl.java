package com.skilldistillery.book.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.book.entities.Book;
import com.skilldistillery.book.repositories.BookRepository;

@Service
public class BookServiceImpl implements BookService {
	@Autowired
	private BookRepository bookRepo;

	@Override
	public List<Book> getAllBooks() {
		List<Book> books = bookRepo.findAll();
		return books;
	}

	@Override
	public Book findById(Integer id) {
		Book book = null;
		Optional<Book> bookOpt = bookRepo.findById(id);
		if (bookOpt.isPresent()) {
			book = bookOpt.get();

		}
		return book;
	}

	@Override
	public Book updateBook(Integer id, Book book) {
		Optional<Book> bookOpt = bookRepo.findById(id);
		Book managedBook = null;
		if (bookOpt.isPresent()) {
			managedBook = bookOpt.get();
		}
		if(book.getTitle() != null) {
			managedBook.setTitle(book.getTitle());
		}
		if (book.getAuthor() != null) {
			managedBook.setAuthor(book.getAuthor());
		}
		if (book.getPublishedYear() != null) {
			managedBook.setPublishedYear(book.getPublishedYear());
		}
		if (book.getDescription() != null) {
			managedBook.setDescription(book.getDescription());
		}
		if (book.getCoverUrl() != null) {
			managedBook.setCoverUrl(book.getCoverUrl());
		}
		if (book.getAuthorUrl() != null) {
			managedBook.setAuthorUrl(book.getAuthorUrl());
		}
		if (book.getPageCount() != null) {
			managedBook.setPageCount(book.getPageCount());
		}
//		if (book.getGenre() != null) {
//			managedBook.setGenre(book.getGenre());
//		}
//		if (book.getPublisher() != null) {
//			managedBook.setPublisher(book.getPublisher());
//		}
//		if (book.getCopies() != null) {
//			managedBook.setCopies(book.getCopies());
//		}
		bookRepo.flush();

		return managedBook;
	}

	@Override
	public Book createBook(Book book) {
//		if (book.getCopies() == null) {
//			book.setCopies(1);
//		}
		bookRepo.saveAndFlush(book);
		return book;
	}

	@Override
	public boolean deleteBook(Integer id) {
		boolean deleted = false;
		Optional<Book> bookOpt = bookRepo.findById(id);
		if(bookOpt.isPresent()) {
		  bookRepo.deleteById(id);
		  deleted = true;
		 	
		}
		
		return deleted;
	}

}
