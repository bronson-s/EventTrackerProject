package com.skilldistillery.book.services;

import java.util.List;

import com.skilldistillery.book.entities.Book;

public interface BookService {
List<Book> getAllBooks();
Book findById(Integer id);
Book updateBook(Integer id, Book book);
Book createBook(Book book);
boolean deleteBook(Integer id);



}
