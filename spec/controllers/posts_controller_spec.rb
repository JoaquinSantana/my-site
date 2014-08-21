require 'spec_helper'

describe PostsController do
	let(:valid_attributes) { { title: "Tytul", description: "To jest krótki opis", body: "To jest zawartość postu" } }
	let(:valid_session) { {} }

	context "non login user" do

		it 'can acces to the show action' do
			post = Post.create! valid_attributes
			get :show, id: post

			expect(response).to render_template :show
		end
		
		it 'cannot acces the new action' do
			get :new

			expect(response).to redirect_to(root_url)
			expect(flash[:alert]).to eq("Brak dostępu")
		end

		it 'cannot acces the edit action' do
			post = Post.create! valid_attributes
			get :edit, { id: post.to_param }, valid_session

			expect(response).to redirect_to(root_url)
			expect(flash[:alert]).to eq("Brak dostępu")
		end

		it 'cannot acces the create action' do
			post :create, { post: valid_attributes }

			expect(response).to redirect_to(root_url)
			expect(flash[:alert]).to eq("Brak dostępu") 
		end

		it 'cannot access the update action' do
			post = Post.create! valid_attributes
			put :update, { :id => post.to_param, :post => { title: "nowy tytul"}}, valid_session

			expect(response).to redirect_to(root_url)
			expect(flash[:alert]).to eq("Brak dostępu")
		end

		it 'cannot acces the destroy action' do
			post = Post.create! valid_attributes
			
			expect{
				delete :destroy, { :id => post.to_param }, valid_session
				}.to_not change(Post, :count).by(-1)

		end
	end

end

