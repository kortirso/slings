Rails.application.routes.draw do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    namespace :api do
        namespace :v1 do
            resources :products, only: %i[create update destroy]
        end
    end

    resources :categories, only: %i[index show]
    resources :products, only: :show
    resources :articles, only: %i[index show]
    resources :carts, only: :show
    resources :orders, only: %i[show create]
    resources :positions, only: %i[create destroy]

    scope controller: :positions do
        post 'plus/:id' => :product_plus, as: :plus
        post 'minus/:id' => :product_minus, as: :minus
        post 'full/:id' => :product_full, as: :full
    end

    scope controller: :pages do
        get 'instructions' => :instructions, as: :instructions
        get 'reviews' => :reviews, as: :reviews
        get 'feedback' => :feedback, as: :feedback
        get 'tailor' => :tailor, as: :tailor
    end

    root to: 'welcome#index'
    match '*path', to: 'application#catch_404', via: :all
end
