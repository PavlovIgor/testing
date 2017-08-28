# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
App.delete_all
Page.delete_all
Test.delete_all

@user = User.new(email: 'igorpavlov.ip@gmail.com', password: 'liver1505', password_confirmation: 'liver1505')
@user.save
p @user

@app = @user.apps.new(name: 'ContentGoo', url: 'https://contentgoo.com')
@app.save
p @app

@page = @app.pages.new(name: 'Home', url: '/')
@page.save
p @page

@test = @page.tests.new(name: 'Code 200', page_code: '200', strategy_type: 'RequestCodeTest')
@test.save
p @page

@page = @app.pages.new(name: 'Contact', url: '/contact')
@page.save
p @page

@test = @page.tests.new(name: 'Code 200', page_code: '200', strategy_type: 'RequestCodeTest')
@test.save
p @page