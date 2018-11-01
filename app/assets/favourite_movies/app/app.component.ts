import {Component, ViewChild} from '@angular/core';
import {MovieService} from "./movie.service";
import {Movie} from "./movie";
import appTemplate from  './app.template.html';
import {FormControl} from "@angular/forms";

@Component({
  selector: 'favourite-movies',
  template: appTemplate
})
export class AppComponent {
  @ViewChild('input') searchInput: FormControl;
  public movies: Movie[];

  constructor(public movieService: MovieService) {
    movieService.fetchMovies('kill').subscribe(movies => this.movies = movies);
  }
}
