Mountportal::Application.routes.draw do
  resources :treks

  namespace "about" do
    get "tos", as: :tos
  end
  devise_for :users,
    controllers: { passwords: 'devise_passwords', registrations: 'devise_registrations', sessions: 'devise_sessions' }
  root to: 'home#index'
end
