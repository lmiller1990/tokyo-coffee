Rails.application.routes.draw do
	devise_for :users
	root 'static_pages#home'

	get '/home', to: 'static_pages#home'
	get '/admin', to: 'static_pages#admin'
	get '/area_search', to: 'static_pages#area_search'
	get '/work_search', to: 'static_pages#work_search'
	get '/rating_search', to: 'static_pages#rating_search'

	resources :shops do
		resources :reviews
	end

	resources :districts
end
