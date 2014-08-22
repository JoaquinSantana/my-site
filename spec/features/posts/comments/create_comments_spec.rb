require 'spec_helper'

feature 'non log in user' do
	before(:each) do
		@post = FactoryGirl.create(:post)
		visit root_url
		click_link "Czytaj więcej"
	end

	scenario 'can create comment' do
		
		fill_in("Podpis", with: 'Stefan')
		fill_in("Twój komentarz", with: 'Mój pierwszy komentarz')
	
		click_button "Zapisz"

		expect(page).to have_content("Twój komentarz został dodany")
		expect(page.current_url).to eq(post_url(@post))
	end

	scenario 'cant create comment with invalid data' do
		click_button "Zapisz"

		expect(page).to have_content("Musisz się podpisać")
		expect(page).to have_content("Pole komentarz musi być uzupełnione")
	end

end