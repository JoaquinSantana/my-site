require 'spec_helper'

feature 'updating post' do 
  scenario 'update with valid data' do
    post = FactoryGirl.create(:post)

    visit root_path
    within ('#blog') do
      click_link "Edytuj"
    end

    expect(page).to have_content("Edycja postu")

    fill_in('Title', with: 'nowy tytul')
    fill_in('Body', with: 'nowa zawartosc postu')

    click_button ("Zapisz")

    expect(page).to have_content("Post został zaaktualizowany")
  end

  scenario "can't update post with invalid data" do
    post = FactoryGirl.create(:post)
    visit root_path
    within ('#blog') do
      click_link "Edytuj"
    end

    expect(page).to have_content("Edycja postu")

    fill_in('Title', with: '')
    fill_in('Body', with: '')

    click_button ("Zapisz")

    expect(page).to have_content("Pole tytuł nie może być puste")
    expect(page).to have_content("Pole body nie może być puste")
    expect(page.current_url).to eq(post_url(post))
  end
end