class AppsController < ApplicationController
	before_action :authenticate_user!

	def index
		@apps = current_user.apps.present? ? current_user.apps : nil
	end

	def show
		@app = current_user.apps.find(params[:id])
		@pages = @app.pages.present? ? @app.pages : nil
	end

	def new
		@app = App.new
	end

	def create
		@app = current_user.apps.new(obj_params)
		if @app.save
			redirect_to apps_path(current_user)
		else
			flash[:alert] = @app.errors.full_messages.to_sentence
			redirect_to new_app_path
		end
	end

	def edit
		@app = current_user.apps.find(params[:id])
	end

	def update
		@app = current_user.apps.find(params[:id])
		if @app.update_attributes(obj_params)
			redirect_to apps_path(current_user)
		else
			flash[:alert] = @app.errors.full_messages.to_sentence
			redirect_to edit_app_path
		end
	end

	def destroy
		@app = current_user.apps.find(params[:id])
		@app.destroy
		redirect_to apps_path(current_user)
	end

private

  def obj_params
    params.require(:app).permit(:name, :url) # allow nested params as array
  end
end