Chattrek::Application.routes.draw do
  devise_for :users,
    controllers: { passwords: 'devise_passwords', registrations: 'devise_registrations', sessions: 'devise_sessions' }
  root to: 'home#index'
end
