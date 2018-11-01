import {Injectable} from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {map} from "rxjs/operators";
import {Movie} from "./movie";
import {Observable} from "rxjs";

@Injectable()
export class MovieService {
  API_URL = 'http://www.omdbapi.com/?apikey=6499c791&s=';
  LOCAL_API_URL = 'http://localhost:3000/favourite_movies';

  constructor(private http: HttpClient) {}

  fetchMovies(search: string): Observable<Movie[]> {
    return this.http.get(`${this.API_URL}${search}`).pipe(map(response => response['Search']));
  }

  saveFavourite(movie: Movie) {
    const movieData = {
      title: movie.Title,
      year: movie.Year,
      imdb_id: movie.imdbID,
      movie_type: movie.Type,
      poster: movie.Poster,
    };
    return this.http.post(this.LOCAL_API_URL, movieData);
  }
}
