Rails.application.routes.draw do
	devise_for :users
	root 'static_pages#home'
	get '/home', to: 'static_pages#home'

	resources :shops do
		resources :reviews
	end
end
