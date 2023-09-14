Rails.application.routes.draw do
  root "locations#index"
  resources :locations do
    post 'fetch_weather', on: :collection
  end
end
