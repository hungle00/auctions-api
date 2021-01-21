Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  #non-default versions have to be defined above the default version.
  scope module: :v2, constraints: ApiVersion.new('v2') do
    resources :auctions, only: :index
  end
  
  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :auctions do
      resources :bids
    end
    resources :activities
  end

end

