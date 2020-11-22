window.addEventListener('load', function () {
    getBooks();
    init();
});
function init() {
document.newBook.create.addEventListener('click', function(e){
    e.preventDefault();
    createNewBook(e);
});
document.goHome.home.addEventListener('click', function (e) {
        e.preventDefault();
        getBooks();
    });


}
function createNewBook(e){
    let form = document.newBook;
    let newBook = {
        title: form.title.value,
        author: form.author.value,
        published: form.publishedYear.value,
        description: form.description.value,
        pageCount: form.pageCount.value,
        genre: form.genre.value,
        publisher: form.publisher.value
    };
    console.log(newBook)
    let xhr = new XMLHttpRequest();
    xhr.open('POST', 'api/books');
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4) {
        if (xhr.status === 201 || xhr.status === 200) {
          let savedBook = JSON.parse(xhr.responseText);
       getBooks();
        } else {
          console.error('Error creating book, status=' + xhr.status);
          console.error(xhr.responseText);
          displayError('Invalid book data.');
        }
      }
    };
    xhr.setRequestHeader('Content-type', 'application/json')
  xhr.send(JSON.stringify(newBook));
    
}
function getBooks() {
    let formDiv = document.getElementById('formDiv');
    formDiv.textContent = "";
    let xhr = new XMLHttpRequest();
    xhr.open('GET', 'api/books');
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                let books = JSON.parse(xhr.responseText);
                console.log(books)
                makeTable(books);
            } else {
                displayError('books unable to load');
            }
        }

    }
    xhr.send();
};
function displayError(msg) {
    let div = document.getElementById('books');
    div.textContent = msg;
};
function makeTable(books) {
    var booksDiv = document.getElementById('books');
    booksDiv.textContent = "";
    var table = document.createElement('table');
    table.style.border = 'solid';
    var head = document.createElement('thead');
    var headTr = document.createElement('tr');
    var th1 = document.createElement('th');
    var th2 = document.createElement('th');
    th1.textContent = 'Title';
    th2.textContent = 'Author';
    headTr.appendChild(th1);
    headTr.appendChild(th2);
    head.appendChild(headTr);
    table.appendChild(head);
    var tBody = document.createElement('tbody');
    for (let i = 0; i < books.length; i++) {
        var tr = document.createElement('tr');
      
        tr.addEventListener('click', function(e){
            e.preventDefault();
            displayBook(books[i]);
        })
        var td1 = document.createElement('td');
        var td2 = document.createElement('td');
        td1.textContent = books[i].title;
        td2.textContent = books[i].author;
        td1.style.border = 'solid';
        td2.style.border = 'solid';
        tr.appendChild(td1);
        tr.appendChild(td2);
        tBody.appendChild(tr);

    }
    table.appendChild(tBody);
    booksDiv.appendChild(table).app;
}
function displayBook(book){
    let booksDiv = document.getElementById('books');
    booksDiv.textContent = "";
    let h3 = document.createElement('h3');
    h3.textContent = book.title;
    booksDiv.appendChild(h3);
    let h4 = document.createElement('h4');
    h3.textContent = book.author;
    booksDiv.appendChild(h4);
    let desc = document.createElement('blockqoute');
    desc.textContent = book.description;
    booksDiv.appendChild(desc);
    let ul = document.createElement('ul');
    booksDiv.appendChild(ul);
    let pages = document.createElement('li');
    pages.textContent = 'Page count: ' + book.pageCount;
    ul.appendChild(pages);
    let publisher = document.createElement('li');
    publisher.textContent = 'Publisher: ' + book.publisher;
    ul.appendChild(publisher);
    let year = document.createElement('li');
    year.textContent = 'Published Year: ' + book.publishedYear;
    ul.appendChild(year);
    let genre = document.createElement('li');
    genre.textContent = 'Genre: ' + book.genre;
    ul.appendChild(genre);

    updateForm(book);
    let deletebtn = document.createElement('button')
    deletebtn.textContent = 'Delete this book';
    booksDiv.appendChild(deletebtn);
    deletebtn.addEventListener('click', function(e){
        e.preventDefault();
        deleteBook(book.id);
    });
    
}
function updateForm(book){
    let formDiv = document.getElementById('formDiv');

    formDiv.textContent = "";
    var form = document.createElement('form');
    form.name = 'updateForm';
    form.id = 'update';
    var inputT = document.createElement('input')
    inputT.name = 'title';
    inputT.type = 'text';
    form.appendChild(inputT);
    inputT.placeholder = book.title;
    var inputA = document.createElement('input')
    inputA.name = 'author';
    inputA.type = 'text';
    form.appendChild(inputA);
    inputA.placeholder = book.author;
    var inputP = document.createElement('input')
    inputP.name = 'publishedYear';
    inputP.type = 'number';
    form.appendChild(inputP);
    inputP.placeholder = book.publishedYear;
    var inputD = document.createElement('input')
    inputD.name = 'description';
    inputD.type = 'text';
    form.appendChild(inputD);
    inputD.placeholder = book.description;
    var inputPg = document.createElement('input')
    inputPg.name = 'pageCount';
    inputPg.type = 'number';
    form.appendChild(inputPg);
    inputPg.placeholder = book.pageCount;
    var inputPb = document.createElement('input')
    inputPb.name = 'publisher';
    inputPb.type = 'text';
    form.appendChild(inputPb);
    inputPb.placeholder = book.publisher;
    var inputG = document.createElement('input')
    inputG.name = 'genre';
    inputG.type = 'text';
    form.appendChild(inputG);
    inputG.placeholder = book.genre;
    
    var submit = document.createElement('input');
    submit.type = 'submit';
    submit.name = 'submit';
    form.appendChild(submit);
    formDiv.appendChild(form);
    submit.addEventListener('click', function(e){
      e.preventDefault();
      updateBook(book, e);
    });
}
function updateBook(book, e){
let form = document.getElementById('update');
let updated ={
   title: form.title.value,
   author: form.author.value,
   publishedYear: form.publishedYear.value,
   description: form.description.value,
   pageCount: form.pageCount.value,
   genre: form.genre.value,
   publisher: form.publisher.value
};
let xhr = new XMLHttpRequest();
xhr.open('PUT', 'api/books/' + book.id);
xhr.onreadystatechange = function() {
  if (xhr.readyState === 4) {
    if (xhr.status === 201 || xhr.status === 200) {
      let savedBook = JSON.parse(xhr.responseText);
      displayBook(savedBook);
    } else {
      console.error('Error creating film, status=' + xhr.status);
      console.error(xhr.responseText);
      displayError('Invalid film data.');
    }
  }
};
xhr.setRequestHeader('Content-type', 'application/json')
  xhr.send(JSON.stringify(updated));

};
function deleteBook(bookid){
    let xhr = new XMLHttpRequest();
    xhr.open('DElETE', 'api/books/' + bookid);
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4) {
        if (xhr.status === 204) {
         
          getBooks();
        } else {
          console.error('Error deleting, status=' + xhr.status);
          console.error(xhr.responseText);
          displayError('error deleting.');
        }
      }
    };
    xhr.setRequestHeader('Content-type', 'application/json')
  xhr.send();
};