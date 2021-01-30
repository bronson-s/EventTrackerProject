package com.skilldistillery.book.services;

import com.skilldistillery.book.entities.User;

public interface AuthService {
	public User register( User user );
	public User getUser( String username );
}
