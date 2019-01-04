require 'rails_helper'

RSpec.describe 'an happy path' do
  it 'goes through all the website', js: true do
    visit root_path
    find('#searchInput')
    # errors = page.driver.browser.manage.logs.get(:browser)
    expect(page).to have_content(I18n.t('title'))
  end

  it 'searches', js: true  do
    visit root_path
    # find('#searchInput')

    expect(page).to have_content(I18n.t('title'))
    fill_in 'searchInput', with: "Jurassic"

    expect(page).to have_content(I18n.t('title'))
    expect(page).to have_selector('mat-card', count: 10)
    fill_in 'searchInput', with: "Jurassic Park III: Island Attack"
    expect(page).to have_selector('mat-card', count: 1)
  end
end
