Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources: parking_spot do
    resources: booking only: [:new, :create, :show, :update]
  end
end
