Rails.application.routes.draw do
  resources :starships
  resources :crew_members, only: [:new,:create]
  get 'admin/hacker_list'

  get 'starships/create_your_own_starship'

  devise_for :admins
  devise_for :hackers
  get 'home/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
