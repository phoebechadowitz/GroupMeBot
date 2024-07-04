Rails.application.routes.draw do
  post 'index', to: 'bot#post'
  get "up" => "rails/health#show", as: :rails_health_check
end
