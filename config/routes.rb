Rails.application.routes.draw do
    resources :categories, only: [:index, :show]
    resources :products, only: :show
    root to: 'categories#index'
    match "*path", to: "application#catch_404", via: :all
end
