require 'spec_helper'

feature 'login user' do 
  before(:each) do
    @user = FactoryGirl.create(:user)
    @post = FactoryGirl.create(:post)
    sign_in(@user)
  end

  scenario 'can create post with valid data' do
    visit root_path

    click_link "Nowy post"
    fill_in("Tytuł postu", with: @post.title)
    fill_in("Krótki opis", with: @post.description)
    fill_in("post_body", with: @post.body)
    click_button "Zapisz"

    expect(page).to have_content("Post został utworzony")
  end

  scenario 'cant create post with invalid data' do
    visit root_path

    click_link "Nowy post"
    fill_in("Tytuł postu", with: "")
    fill_in("Krótki opis", with: "")
    fill_in("post_body", with: "")
    click_button "Zapisz"

    expect(page).to have_content("Pole tytuł nie może być puste")
    expect(page).to have_content("Pole body nie może być puste")
    expect(page).to have_content("Pole opisu nie może być puste")
  end
end

feature 'non login user' do
  scenario 'cant create post' do
    visit root_path

    expect(page).to_not have_content("Nowy post")
  end
end