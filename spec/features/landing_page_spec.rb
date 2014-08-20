require 'spec_helper'

feature 'Landing page' do
  before :each do 
    @post = FactoryGirl.create(:post)
  end

  scenario 'not registered user' do
    visit root_path

    expect(page).to have_content("Tomasz Panek")
  end

  scenario 'visit blog post' do
    visit root_path
    within("#blog") do
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@post.body)
    end
  end
end
