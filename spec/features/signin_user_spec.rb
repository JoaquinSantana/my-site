require 'spec_helper'

feature 'signin for site' do
	before(:each) do
		@user = FactoryGirl.create(:user)
	end

	scenario 'with correct data' do
		visit root_path
		expect(page).to have_css(".fa-sign-in")
		find(:xpath, "//a[@href='/users/sign_in']").click

		fill_in('Email', with: @user.email)
		fill_in('Hasło', with: @user.password)
	
		click_button "Zaloguj"

		expect(page).to have_content("Zalogowałeś się na blogu")
		expect(page.current_url).to eq(root_url)
	end

	scenario 'with invalid data' do
		visit root_path
		find(:xpath, "//a[@href='/users/sign_in']").click

		click_button "Zaloguj"
		expect(page).to have_content('Brak dostępu')
		expect(page.current_url).to eq(root_url)
	end
end