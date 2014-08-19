module AuthenticationHelpers
	def sign_in(user)
		visit new_user_session_path
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button 'Zaloguj'
		expect(page).to have_content("Zalogowałeś się na blogu")
	end
end

RSpec.configure do |c|
	c.include AuthenticationHelpers, type: :feature
end