require 'spec_helper'

feature "show post page" do
	scenario 'not registered users visit post' do
		post = FactoryGirl.create(:post)

		visit root_path
		within ('#blog') do
			click_link("Czytaj więcej", :match => :first)
		end

		expect(page).to have_content(post.title)
	end
end