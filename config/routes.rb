Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, skip: [:registrations], controllers: {sessions: 'admins/sessions'}

  namespace :admin do
    root to: "home#index"
    resources :admins
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
