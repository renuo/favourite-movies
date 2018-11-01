require 'rails_helper'

RSpec.describe 'an happy path' do
  it 'goes through all the website', js: true do
    visit root_path
    find('#searchInput')
    # errors = page.driver.browser.manage.logs.get(:browser)
    expect(page).to have_content(I18n.t('title'))
  end

  it 'searches', :vcr  do
    visit root_path
    find('#searchInput')

    expect(page).to have_content(I18n.t('title'))
    fill_in 'searchInput', with: "Jurassic"

    expect(page).to have_content(I18n.t('title'))
    expect(all('mat-card').size).to eq(10)
    fill_in 'searchInput', with: "Jurassic Park III: Island Attack"
    expect(all('mat-card').size).to eq(1)
  end
end
