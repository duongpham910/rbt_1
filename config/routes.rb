Rails.application.routes.draw do
  root "static_pages#home"
  namespace :manager do
    root "static_pages#index"
<<<<<<< HEAD
    resources :categories
  end  
=======
  end
  resources :movies, only: [:show]
>>>>>>> show_movie
end
