
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators'
import { environment } from 'src/environments/environment';
import { Book } from '../models/book';

@Injectable({
  providedIn: 'root'
})
export class BookService {
// private baseUrl ='http://localhost:8085/';
private url = environment.baseUrl + 'api/books'

index() : Observable<Book[]>{
  return this.http.get<Book[]>(this.url + '?sorted=true')
  .pipe(
    catchError((err: any) => {
      console.log(err);
      return throwError('KABOOM');
    })
  );
}
create(data) {
  console.log(data)
  return this.http.post<Book>(this.url, data)
    .pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError('KABOOM');
      })
    );
}

update(id: number, data: Book) {
  console.log(data)
  const httpOptions = { };
  return this.http.put<Book>(this.url +'/'+ id, data, httpOptions);
}
destroy(id: number) {
 const httpOptions = { };
  return this.http.delete<any>(this.url +'/'+ id, httpOptions);

}

constructor(private http: HttpClient) { }

}
