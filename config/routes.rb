Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :roles, except: :show
  resources :users, except: :show
  resources :permissions do
    collection do
      post :remove
    end
  end
  resources :subjects, except: :show
  resources :students, except: :show
  resources :courses, except: :show
  resources :schedules, except: :show
end
