Mountportal::Application.routes.draw do
  namespace "about" do
    get "privacy", as: :privacy
    get "tos", as: :tos
  end
  devise_for :users,
    controllers: { passwords: 'devise_passwords', registrations: 'devise_registrations', sessions: 'devise_sessions' }
  root to: 'home#index'
end
