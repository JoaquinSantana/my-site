require 'spec_helper'

feature 'owner of site' do 
    
    before(:each) do
      @user = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post)
      sign_in(@user)
    end

    scenario 'can with valid data' do
      visit root_path

      within ('#blog') do
        click_link("Edytuj", :match => :first)
      end

      expect(page).to have_content("Edycja postu")

      fill_in('Tytuł postu', with: 'nowy tytul')
      fill_in('Krótki opis', with: 'nowy opis')
      fill_in('Zawartość postu', with: 'nowa zawartosc postu')

      click_button ("Zapisz")

      expect(page).to have_content("Post został zaaktualizowany")
    end

    scenario "can't update post with invalid data" do
      post = FactoryGirl.create(:post)
      visit root_path
      within ('#blog') do
        click_link("Edytuj", :match => :first)
      end

      expect(page).to have_content("Edycja postu")

      fill_in('Tytuł postu', with: '')
      fill_in('Krótki opis', with: '')
      fill_in('Zawartość postu', with: '')

      click_button ("Zapisz")

      expect(page).to have_content("Pole tytuł nie może być puste")
      expect(page).to have_content("Pole body nie może być puste")
      expect(page).to have_content("Pole opisu nie może być puste")
      expect(page.current_url).to eq(post_url(post))
    end
end