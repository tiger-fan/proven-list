Rails.application.routes.draw do
  resources :widgets
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'visitors#index'
  devise_for :users, :controllers => {:registrations => "users/registrations", omniauth_callbacks: 'omniauth_callbacks'}
  resources :users
  # patch 'update_password', on: :collection
  devise_scope :user do
    get 'users/edit/password' => 'users/registrations#edit_password'
    put 'users/edit/update_password/' => 'users/registrations#update_password'
    match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  end
end
