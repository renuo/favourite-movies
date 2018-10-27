require 'rails_helper'

RSpec.describe 'an happy path' do
  it 'goes through all the website', js: true do
    visit root_path
    expect(page).to have_content(I18n.t('title'))
  end
end
