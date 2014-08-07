require 'spec_helper'

feature 'home page' do
  scenario 'landing page' do
    visit '/'

    expect(page).to have_content("Tomasz Panek")
  end
end