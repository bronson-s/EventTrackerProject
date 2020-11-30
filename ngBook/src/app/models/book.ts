export class Book {
  title: string;
  author: string;
  publishedYear: number;
  description: string;
  coverUrl: string;
  pageCount: number;
  genre: string;
  publisher:string;
  copies:number;
constructor(
  title?: string,
  author?: string,
  publishedYear?: number,
  description?: string,
  coverUrl?: string,
  pageCount?: number,
  genre?: string,
  publisher?:string,
  copies?:number

){
  this.title= title;
  this.author= author;
  this.publishedYear= publishedYear;
  this.description= description;
  this.coverUrl= coverUrl;
  this.pageCount= pageCount;
  this.genre= genre;
  this.publisher=publisher;
  this.copies=copies;
}
}
