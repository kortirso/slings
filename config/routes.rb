Rails.application.routes.draw do
    resources :categories, only: [:index, :show]
    resources :products, only: :show
    resources :articles, only: :index
    resources :carts, only: :show

    get 'reviews' => 'pages#reviews', as: :reviews
    get 'feedback' => 'pages#feedback', as: :feedback
    get 'tailor' => 'pages#tailor', as: :tailor

    root to: 'welcome#index'
    match "*path", to: "application#catch_404", via: :all
end
