Rails.application.routes.draw do
  devise_for :users do
    resources :deposits, only: [:index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :deposits
  end


  root 'pages#home'
  get '/deposits' , to: 'pages#deposits'
  get '/contact' , to: 'pages#contact'
  get '/about' , to: 'pages#about'

  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"

end
