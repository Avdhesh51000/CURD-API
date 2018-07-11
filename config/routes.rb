Rails.application.routes.draw do
 devise_for :users
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root "mys#index"
 # get 'signup', to: 'users#signup'
 # get 'login', to: 'users#login'
 get '/faq' , to: 'mys#faq'
 get '/help' , to: 'mys#help'
 get '/pp' , to: 'mys#privacy-policy'
 get '/tc' , to: 'mys#terms-conditions'

end
