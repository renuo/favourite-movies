require 'rails_helper'

RSpec.describe MovieSearch do
  subject { described_class.new(query: 'kill') }

  before do
    response = {"Search":[
                 {"Title":"Kill Bill: Vol. 1",
                  "Year":"2003",
                  "imdbID":"tt0266697",
                  "Type":"movie",
                  "Poster":"https://m.media-amazon.com/images/M/blub.jpg"
               }]}.to_json
    puts response

    stub_request(:get, 'https://www.omdbapi.com/')
      .with(query: {apikey: '6499c791', s: 'kill'})
      .to_return(body: response)
  end

  it 'returns potential favorite movies' do
    expect(subject.results).to all(be_a(FavoriteMovie))
  end
end
