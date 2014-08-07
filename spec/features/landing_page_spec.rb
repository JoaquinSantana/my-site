require 'spec_helper'

feature 'Landing page' do
  scenario 'not registered user' do
    visit root_path

    expect(page).to have_content("Tomasz Panek")
  end
end
