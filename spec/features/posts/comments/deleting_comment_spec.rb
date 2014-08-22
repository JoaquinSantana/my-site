require 'spec_helper' 


feature 'user' do
	before(:each) do
		user = FactoryGirl.create(:user)
		@post = FactoryGirl.create(:post)
		@comment = FactoryGirl.create(:comment)
		@post.comments << @comment

		expect(@post.comments).to include(@comment)
		expect(@comment.post).to eq(@post)
		
		sign_in(user)
		
		visit root_path
		click_link "Czytaj więcej"
	end
	
	scenario 'can deleted anywone comment' do
		
		expect { click_link("Usuń", :match => :first) }.to change(Comment, :count).by(-1)
		expect(page).to have_content("Komentarz został usunięty")
	end
end