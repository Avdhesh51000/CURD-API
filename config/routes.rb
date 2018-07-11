Rails.application.routes.draw do
	resources :users
    resource  :verifications
	root 'users#new'
	post 'abc/:id/', to: 'users#abc', as: 'abc'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
