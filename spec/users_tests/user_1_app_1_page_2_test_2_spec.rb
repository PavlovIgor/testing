
require 'rails_helper'
require 'capybara/mechanize'

feature 'Test Code 200' do

	before(:each) do
		Capybara.current_driver = :mechanize
		Capybara.app_host = 'https://contentgoo.com'
	end

	before { visit '/contact' }
	subject { page }

	it { should have_http_status(404) }

end
