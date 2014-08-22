require 'spec_helper'

feature 'edit comment' do
	before(:each) do
		@post = FactoryGirl.create(:post)
		@comment = FactoryGirl.create(:comment)
		@post.comments << @comment

		expect(@post.comments).to include(@comment)
		expect(@comment.post).to eq(@post)
		visit root_path
		click_link "Czytaj więcej"
	end

	scenario 'non login user cant edit anywone comment' do
		expect(page).to_not have_content("Edytuj")
	end
	
	scenario 'login user (owner of blog) can edit' do
		user = FactoryGirl.create(:user)
		sign_in(user)
		click_link "Czytaj więcej"
		click_link("Edytuj", :match => :first)
		fill_in("Podpis", with: "Vincent")
		fill_in("Twój komentarz", with: "New comment")
		click_button("Zapisz")

		expect(page).to have_content("Komentarz został zmieniony")
		expect(page).to have_content("Vincent")
	end
end