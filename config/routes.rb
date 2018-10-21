Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboards#show"
  end
  root to: "homes#show"
  resources :shouts, only: [:create]
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  # Don't make sessions to go to default clearnace session,instead direct it to sessions controller we made to ride over default
  resource :session, only: [:create]

  resources :users, only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

# use our sessions controller that we created instead of Clearnce sessions controller
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
