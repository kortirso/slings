source 'https://rubygems.org'

ruby '2.3.1'

git_source(:github) do |repo_name|
    repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
    "https://github.com/#{repo_name}.git"
end

gem 'rails', '5.1.4'
gem 'pg', '0.21'
gem 'puma', '3.10.0'
gem 'sass-rails', '5.0.6'
gem 'uglifier', '3.2.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'erubis'

gem 'figaro'
gem 'foundation-rails', '6.4.1.3'
gem 'autoprefixer-rails', '6.7.6'
gem 'slim'
gem 'trix'
gem 'friendly_id', '~> 5.1.0'
gem 'babosa'
gem 'carrierwave', '~> 1.0'
gem 'rmagick'
gem 'active_model_serializers', '~> 0.10.0'
gem 'rails_admin', '~> 1.1.1'

# Add Webpack
gem 'foreman'
gem 'webpacker', '2.0'
gem 'webpacker-react', '~> 0.2.0'

group :development do
    gem 'listen', '~> 3.0.5'
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
    gem 'capistrano', require: false
    gem 'capistrano-bundler', require: false
    gem 'capistrano-rails', require: false
    gem 'capistrano-rvm', require: false
end

group :development, :test do
    gem 'rspec-rails'
    gem 'factory_girl_rails'
    gem 'rails-controller-testing'
    gem 'capybara'
    gem 'database_cleaner'
end

group :test do
    gem 'shoulda-matchers'
    gem 'json_spec'
end
