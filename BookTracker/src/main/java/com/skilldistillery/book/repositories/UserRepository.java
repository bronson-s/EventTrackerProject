package com.skilldistillery.book.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import com.skilldistillery.book.entities.*;

public interface UserRepository extends JpaRepository<User, Integer> {
	User findByUsername(String username);
}
