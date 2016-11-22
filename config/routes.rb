 Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  resources :articles do
   resources :comments

  end
  root 'articles#index'
  devise_for :users, :controllers => { registrations: 'users/registrations' }   
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
