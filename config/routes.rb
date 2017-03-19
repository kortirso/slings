Rails.application.routes.draw do
    resources :categories, only: [:index, :show]
    resources :products, only: :show
    resources :articles, only: :index

    get 'reviews' => 'pages#reviews', as: 'reviews'
    get 'feedback' => 'pages#feedback', as: 'feedback'

    root to: 'welcome#index'
    match "*path", to: "application#catch_404", via: :all
end
