Rails.application.routes.draw do

    namespace :api do
        namespace :v1 do
            resources :products, only: :create
        end
    end

    resources :categories, only: [:index, :show]
    resources :products, only: :show
    resources :articles, only: :index
    resources :carts, only: :show
    resources :orders, only: [:show, :create]
    resources :positions, only: [:create, :destroy]

    scope controller: :positions do
        #post 'create' => :create, as: :positions
        post 'plus/:id' => :product_plus, as: :plus
        post 'minus/:id' => :product_minus, as: :minus
        post 'full/:id' => :product_full, as: :full
    end
    
    get 'reviews' => 'pages#reviews', as: :reviews
    get 'feedback' => 'pages#feedback', as: :feedback
    get 'tailor' => 'pages#tailor', as: :tailor

    root to: 'welcome#index'
    match "*path", to: "application#catch_404", via: :all
end
