require "rspec/core"

class RequestCodeTest

	def self.attrs
		[:name, :page_code]
	end

	def test_code
"
require 'rails_helper'
require 'capybara/mechanize'

feature 'Test "+@obj.name+"' do

	before(:each) do
		Capybara.current_driver = :mechanize
		Capybara.app_host = '"+@obj.page.app.url+"'
	end

	before { visit '"+@obj.page.url+"' }
	subject { page }

	it { should have_http_status("+@obj.page_code+") }

end
"
	end

	def start
		# err, out = StringIO.new, StringIO.new
		@spec_result = RSpec::Core::Runner.run([ @obj.file_path], err = $stderr, out = $stdout)
		p @spec_result
		# out.rewind;
		p err.read
		RSpec.clear_examples
	end

private
	attr_reader :name, :page_code

	def initialize(obj)
		@obj = obj
	end

end