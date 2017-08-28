Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"

  resources :apps do
  	resources :pages do
  		resources :tests do
			member do
				get 'start'
			end
		end
  	end
  end

end
