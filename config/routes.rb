Mountportal::Application.routes.draw do

  resources :comments, only: %i(create destroy edit index show update)
  resources :figures, only: %i(create destroy)
  resources :profiles, only: %i(edit show update)
  resources :treks

  namespace "about" do
    get "tos", as: :tos
  end
  devise_for :users,
    controllers: { passwords: 'devise_passwords', registrations: 'devise_registrations', sessions: 'devise_sessions' }
  root to: 'home#index'
end
