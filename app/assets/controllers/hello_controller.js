import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input", "output", "favourites", "messages"];

  connect() {
    console.log('hello from sitmuliu');
  }

  search() {
    const dataList = this.outputTargets[0];
    dataList.innerHTML = "";
    $.ajax({
      url: 'http://www.omdbapi.com',
      method: "GET",
      data: { s: this.inputTargets[0].value, apikey: '6499c791' },
      success: function (result) {
        result['Search'].forEach((movie) => {
          const template = document.querySelector('[data-movie-template]');

          const clone = document.importNode(template.content, true);
          clone.querySelector('[data-title]').innerHTML = movie['Title'];
          clone.querySelector('[data-image]').src = movie['Poster'];
          let dataset = clone.querySelector('[data-card]').dataset;
          dataset.movieId = movie['imdbID'];
          dataset.posterUrl = movie['Poster'];
          dataset.title = movie['Title'];
          dataset.year = movie['Year'];

          dataList.appendChild(clone);
        });
      }
    })
  }

  star(event) {
    event.preventDefault();
    const data = event.target.closest('[data-card]').dataset;
    $.ajax({
      url: '/movies',
      method: "POST",
      dataType: "json",
      data: { movie: { external_id: data.movieId, title: data.title, year: data.year, poster_url: data.posterUrl }},
      success: function (result) {
        document.body.append(result['message'])
      }
    });
  }
}
