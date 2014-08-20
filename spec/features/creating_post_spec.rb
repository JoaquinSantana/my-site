require 'spec_helper'

feature 'login user can create post' do 
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in(@user)
  end

  scenario 'with valid data' do
    visit root_path

    click_link "Nowy post"
    fill_in("Title", with: "Pierwszy Post")
    fill_in("Body", with: "To jest moj pierwszy post")
    click_button "Zapisz"

    expect(page).to have_content("Post został utworzony")
  end

  scenario 'with invalid data' do
    visit root_path

    click_link "Nowy post"
    fill_in("Title", with: "")
    fill_in("Body", with: "")
    click_button "Zapisz"

    expect(page).to have_content("Pole tytuł nie może być puste")
    expect(page).to have_content("Pole body nie może być puste")
  end
end

feature 'non login user' do
  scenario 'cant create post' do
    visit root_path

    expect(page).to_not have_content("Nowy post")
  end
end