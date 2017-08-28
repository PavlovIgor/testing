source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'redis', '~> 3.0'

gem 'bcrypt', '~> 3.1.7'
gem 'devise', '~> 4.3.0'

gem "haml-rails", "~> 0.9"
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'


gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'


gem 'rspec-rails', '~> 3.6'
gem 'capybara', '~> 2.11.0'
# gem 'selenium-webdriver', '~> 3.5.1'
# gem 'geckodriver-helper', '~> 0.0.3'
gem 'capybara-mechanize', '~> 1.5.0'
# gem 'capistrano-rails', group: :development

# gem 'graphql'


group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
