import {Component, OnInit} from '@angular/core';
import {MovieService} from "./movie.service";
import {FavouriteMovie, Movie} from "./movie";
import appTemplate from  './app.template.html';
import {debounceTime} from "rxjs/operators";
import {Subject} from "rxjs";

@Component({
  selector: 'favourite-movies',
  template: appTemplate
})
export class AppComponent implements OnInit {
  private subject: Subject<string> = new Subject();
  public movies: Movie[];
  public favouriteMovies: FavouriteMovie[];

  constructor(public movieService: MovieService) {
  }

  private searchMovies(term: string) {
    this.movieService.fetchMovies(term).subscribe(movies => this.movies = movies);
  }

  public searchKeyUp(term: string) {
    this.subject.next(term);
  }

  ngOnInit() {
    this.movieService.fetchFavourites().subscribe(movies => this.favouriteMovies = movies);
    this.subject.pipe(debounceTime(400)).subscribe(term => this.searchMovies(term));
  }

  saveFavourite(movie: Movie) {
    this.movieService.saveFavourite(movie).subscribe(data => {
      this.favouriteMovies.push(data as FavouriteMovie);
    });
  }
}
