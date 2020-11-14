package com.skilldistillery.book.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.book.entities.Book;

public interface BookRepository extends JpaRepository<Book, Integer> {
List<Book> findByAuthor(String author);
List<Book> findByTitleLike(String title);
List<Book> findByPublisher(String publisher);

}
