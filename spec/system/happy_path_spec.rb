require 'rails_helper'

RSpec.describe 'an happy path' do
  it 'goes through all the website', js: true do
    movie_name = 'Kill Bill: Vol. 1'
    visit root_path
    expect(page).to have_content(I18n.t('title'))
    fill_in('search-field', with: 'Kill')
    click_button I18n.t('buttons.search')
    expect(page).to have_content(movie_name)
    first('a', text: I18n.t('buttons.add_favourite')).click
    expect(page).to have_content(I18n.t('movie.create.success'))
    click_link I18n.t('buttons.go_to_favourites')
    expect(page).to have_content movie_name
  end
end
