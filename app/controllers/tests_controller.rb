class TestsController < ApplicationController
	before_action :authenticate_user!

	def show
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:page_id])
		@test = @page.tests.find(params[:id])
	end

	def new
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:page_id])
		@test = @page.tests.new
	end

	def create
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:page_id])
		@test = @page.tests.new(obj_params)
		if @test.save
			redirect_to app_page_path(@app, @page)
		else
			flash[:alert] = @test.errors.full_messages.to_sentence
			redirect_to new_app_page_test_path
		end
	end

	def edit
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:page_id])
		@test = @page.tests.find(params[:id])
	end

	def update
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:page_id])
		@test = @page.tests.find(params[:id])
		if @test.update_attributes(obj_params)
			redirect_to app_page_path(@app, @page)
		else
			flash[:alert] = @test.errors.full_messages.to_sentence
			redirect_to edit_app_page_test_path(@app, @page, @test)
		end
	end

	def destroy
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:page_id])
		@test = @page.tests.find(params[:id])
		@test.destroy
		redirect_to app_page_path(@app, @page)
	end

	def start
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:page_id])
		@test = @page.tests.find(params[:id])
		@test.start
		redirect_to app_page_test_path(@app, @page, @test)
	end


private

  def obj_params
    params.require(:test).permit(:name, :page_code) # allow nested params as array
  end
end