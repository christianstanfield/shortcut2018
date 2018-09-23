Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'ballots#new'

  resources :ballots, only: [:new, :create, :show] do
    get :results, on: :collection
  end
end
