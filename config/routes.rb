Rails.application.routes.draw do
	devise_for :users
	root 'static_pages#home'
	get '/home', to: 'static_pages#home'
	get '/admin', to: 'static_pages#admin'

	resources :shops do
		resources :reviews
	end

	resources :districts
end
