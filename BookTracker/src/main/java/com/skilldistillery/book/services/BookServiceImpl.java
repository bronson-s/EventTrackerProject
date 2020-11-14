package com.skilldistillery.book.services;

import java.util.List;

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
	// TODO Auto-generated method stub
	return null;
}

}
