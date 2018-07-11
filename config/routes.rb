Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users # do 
  # 	collection { post :import }
  # end

  post '/', to: 'users#import', as: 'import_users'

  root 'users#index'

end
