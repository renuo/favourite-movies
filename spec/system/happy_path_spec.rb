require 'rails_helper'

RSpec.describe 'an happy path' do
  it 'goes through all the website', js: true, driver: :chrome do
    visit root_path
    # errors = page.driver.browser.manage.logs.get(:browser)
    expect(page).to have_content(I18n.t('title'))
  end
end
