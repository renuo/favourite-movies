import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import {MovieService} from "./movie.service";
import {Movie} from "./movie";
import appTemplate from  './app.template.html';
import {FormControl} from "@angular/forms";
import {debounceTime, distinct, distinctUntilChanged, switchMap} from "rxjs/operators";
import {Subject} from "rxjs";

@Component({
  selector: 'favourite-movies',
  template: appTemplate
})
export class AppComponent implements OnInit {
  // @ViewChild('searchInput') searchInput: ElementRef;
  // searchInput: FormControl;
  private subject: Subject<string> = new Subject();
  public movies: Movie[];

  constructor(public movieService: MovieService) {
    // this.searchMovies('');
    // this.searchInput = new FormControl({ value: '' })
  }

  private searchMovies(term: string) {
    console.log('term', term);
    this.movieService.fetchMovies(term).subscribe(movies => this.movies = movies);
  }

  public searchKeyUp(term: string) {
    this.subject.next(term);
  }

  ngOnInit() {
    this.subject.pipe(debounceTime(400)).subscribe(term => this.searchMovies(term));
    // console.log(this.searchInput);
    // this.searchInput.valueChanges.pipe(
    //   debounceTime(400),
    //   distinctUntilChanged(),
    //   switchMap(term => this.movieService.fetchMovies(term)))
  }
}
