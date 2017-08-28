class PagesController < ApplicationController
	before_action :authenticate_user!

	def show
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:id])
		@tests = @page.tests.present? ? @page.tests : nil
	end

	def new
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.new
	end

	def create
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.new(obj_params)
		if @page.save
			redirect_to app_path(@app)
		else
			flash[:alert] = @page.errors.full_messages.to_sentence
			redirect_to new_app_page_path
		end
	end

	def edit
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:id])
	end

	def update
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:id])
		if @page.update_attributes(obj_params)
			redirect_to app_path(@app)
		else
			flash[:alert] = @page.errors.full_messages.to_sentence
			redirect_to edit_app_page_path(@app, @page)
		end
	end

	def destroy
		@app = current_user.apps.find(params[:app_id])
		@page = @app.pages.find(params[:id])
		@page.destroy
		redirect_to app_path(@app)
	end

private

  def obj_params
    params.require(:page).permit(:name, :url) # allow nested params as array
  end
end