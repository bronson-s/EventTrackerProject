package com.skilldistillery.book.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.book.entities.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {

}
