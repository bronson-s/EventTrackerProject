import { BookService } from './../../services/book.service';
import { Component, OnInit } from '@angular/core';
import { Book } from 'src/app/models/book';
import { NgbModal, ModalDismissReasons } from '@ng-bootstrap/ng-bootstrap';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-book-list',
  templateUrl: './book-list.component.html',
  styleUrls: ['./book-list.component.css']
})
export class BookListComponent implements OnInit {
  closeResult: string;
  newBook = new Book();
  editBook = new Book();
  books: Book[] = [];
  selected = null;
  constructor(private bookService: BookService, private modalService: NgbModal) { }

  ngOnInit(): void {
    this.loadBooks();
  }
  loadBooks(): void {
    this.bookService.index().subscribe(
      (data) => { this.books = data },
      (err) => { console.log(err) }
    )
  }

  open(content) {
    this.modalService.open(content, { ariaLabelledBy: 'modal-basic-title' }).result.then((result) => {
      this.closeResult = `Closed with: ${result}`;
    }, (reason) => {
      this.closeResult = `Dismissed ${this.getDismissReason(reason)}`;
    });
  }

  private getDismissReason(reason: any): string {
    if (reason === ModalDismissReasons.ESC) {
      return 'by pressing ESC';
    } else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
      return 'by clicking on a backdrop';
    } else {
      return `with: ${reason}`;
    }
  }

  onSubmit(book) {
    this.bookService.create(book).subscribe(
      data => {
        this.loadBooks;
      },
      err => console.error('Observer got an error: ' + err)
    );

    this.modalService.dismissAll(); //dismiss the modal
    this.bookService.index().subscribe(
      (data) => { this.books = data },
      (err) => { console.log(err) }
    )
  }
  onUpdate(book) {
    this.bookService.update(this.selected.id, book).subscribe(
      data => {
        this.loadBooks;
      },
      err => console.error('Observer got an error: ' + err)
    );
    this.selected = Object.assign({}, book);



    this.modalService.dismissAll();
    this.loadBooks();
  }
  goBack() {
    this.selected = null;
    this.loadBooks();
  }

  openDelete(targetModal, book: Book) {

    this.modalService.open(targetModal, {
      backdrop: 'static',
      size: 'lg'
    });
  }
  onDelete(id) {
    this.bookService.destroy(id).subscribe(
      data => {
        this.loadBooks;
      },
      err => console.error('Observer got an error: ' + err)
    );
    this.modalService.dismissAll();
    this.goBack();
    this.loadBooks();
  }

}
