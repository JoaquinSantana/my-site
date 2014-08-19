require 'spec_helper'

feature 'signin for site' do
	before(:each) do
		@user = FactoryGirl.create(:user)
	end

	scenario 'with correct data' do
		visit root_path
		click_link "Zaloguj"
		fill_in('Email', with: @user.email)
		fill_in('Password', with: @user.password)
	
		click_button "Zaloguj"

		expect(page).to have_content("Zalogowałeś się na blogu")
		expect(page.current_url).to eq(root_url)
	end

	scenario 'with invalid data' do
		visit root_path
		click_link "Zaloguj"

		click_button "Zaloguj"
		expect(page).to have_content('Pole login/hasło nie może być puste')
		expect(page.current_url).to eq(new_user_session_url)
	end
end