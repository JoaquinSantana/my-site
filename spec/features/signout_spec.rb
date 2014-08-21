require 'spec_helper'


feature 'user log out' do 
	scenario 'correct logout' do
		user = FactoryGirl.create(:user)

		sign_in(user)

		visit root_path
		expect(page).to have_css(".fa-sign-out")
		find(:xpath, "//a[@href='/users/sign_out']").click

		expect(page).to have_css(".fa-sign-in")
		expect(page).to have_content("Zostałeś wylogowany")
		expect(page.current_url).to eq(root_url)
	end
end
	