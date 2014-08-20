require 'spec_helper'


feature 'user log out' do 
	scenario 'correct logout' do
		user = FactoryGirl.create(:user)

		sign_in(user)

		visit root_path
		expect(page).to have_content("Wyloguj")
		click_link "Wyloguj"

		expect(page).to have_content("Zostałeś wylogowany")
		expect(page).to_not have_content("Wyloguj")
		expect(page.current_url).to eq(root_url)
	end
end
	