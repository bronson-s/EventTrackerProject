package com.skilldistillery.book.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Book {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
private String title;
private String author;
@Column(name="published_year")
private Integer publishedYear;
private String description;
@Column(name="cover_url")
private String coverUrl;
@Column(name="author_url")
private String authorUrl;
@Column(name="page_count")
private Integer pageCount;
private String genre;
private String publisher;


public Book() {
	super();
}


@Override
public String toString() {
	return "Book [id=" + id + ", title=" + title + ", author=" + author + ", publishedYear=" + publishedYear
			+ ", description=" + description + ", coverUrl=" + coverUrl + ", authorUrl=" + authorUrl + ", pageCount="
			+ pageCount + ", genre=" + genre + ", publisher=" + publisher + "]";
}


public int getId() {
	return id;
}


public void setId(int id) {
	this.id = id;
}


public String getTitle() {
	return title;
}


public void setTitle(String title) {
	this.title = title;
}


public String getAuthor() {
	return author;
}


public void setAuthor(String author) {
	this.author = author;
}


public Integer getPublishedYear() {
	return publishedYear;
}


public void setPublishedYear(Integer publishedYear) {
	this.publishedYear = publishedYear;
}


public String getDescription() {
	return description;
}


public void setDescription(String description) {
	this.description = description;
}


public String getCoverUrl() {
	return coverUrl;
}


public void setCoverUrl(String coverUrl) {
	this.coverUrl = coverUrl;
}


public String getAuthorUrl() {
	return authorUrl;
}


public void setAuthorUrl(String authorUrl) {
	this.authorUrl = authorUrl;
}


public Integer getPageCount() {
	return pageCount;
}


public void setPageCount(Integer pageCount) {
	this.pageCount = pageCount;
}


public String getGenre() {
	return genre;
}


public void setGenre(String genre) {
	this.genre = genre;
}


public String getPublisher() {
	return publisher;
}


public void setPublisher(String publisher) {
	this.publisher = publisher;
}


@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + id;
	return result;
}


@Override
public boolean equals(Object obj) {
	if (this == obj)
		return true;
	if (obj == null)
		return false;
	if (getClass() != obj.getClass())
		return false;
	Book other = (Book) obj;
	if (id != other.id)
		return false;
	return true;
}
}

