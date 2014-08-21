require 'spec_helper'

feature 'deletig post' do
  scenario 'user(owner of site) can deleting' do
    post = FactoryGirl.create(:post)
    user = FactoryGirl.create(:user)

    sign_in(user)
    visit root_url

    within("#blog") do
      click_link("Usuń", :match => :first)
    end

    expect(page).to have_content("Post został usunięty")
    expect(page.current_url).to eq(root_url)
  end
end