Rails.application.routes.draw do

  resources :admins

  get 'admin_dashboard' => 'admins#dashboard'
  get 'admin_profile' => 'admins#profile'

  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations"}

  devise_scope :user do
    post 'update_info', to: 'registrations#update_info'
  end

  match 'register' => 'users#new_register', via: [:get]

  #resources :users, :only => [] do
  resources :users do
    collection do
      post 'unsubscribe'
    end
  end

  get 'applicant_dashboard' => 'applicants#dashboard'
  get 'applicant_profile' => 'applicants#profile'
  get 'edit_profile' => 'applicants#edit_profile'
  patch 'complete_profile_user' => 'applicants#complete_profile_user'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
