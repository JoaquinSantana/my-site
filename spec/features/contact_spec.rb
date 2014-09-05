require 'spec_helper'

feature 'contact form' do
	scenario 'with valid data' do
			visit root_path
				within("#contact") do
		      fill_in("Podpis", with: "Frank")
		      fill_in("Email", with: "example@google.com")
		      fill_in("Twoja wiadomość", with: 'wiadomość')

		      click_button "Wyślij"

		    end
		  expect(page).to have_content("Dziękuję za wysłanie wiadomości")
	end

	scenario 'with invalid data' do
		visit root_path
			within("#contact") do
	      fill_in("Podpis", with: "")
	      fill_in("Email", with: "")
	      fill_in("Twoja wiadomość", with: '')

	      click_button "Wyślij"
	    end
	    
    expect(page).to have_content("Pole wiadomość nie może być puste")
    expect(page).to have_content("Wpisz prawidłowy email")
    expect(page).to have_content("Pole podpis nie może być puste")
	end
end