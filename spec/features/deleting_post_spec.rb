require 'spec_helper'

feature 'deletig post' do
  scenario 'deleting' do
    post = FactoryGirl.create(:post)
    visit root_url

    within("#blog") do
      click_link "Usuń"
    end

    expect(page).to have_content("Post został usunięty")
    expect(page.current_url).to eq(root_url)
  end
end