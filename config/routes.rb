Rails.application.routes.draw do

  
    
namespace :api do
  namespace :v1 do
    resources :users do
      resources :medical_recommendations
      resources :state_ids
    end
  end
end

  
  root 'api/v1/users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
