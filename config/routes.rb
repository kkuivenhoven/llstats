Rails.application.routes.draw do

  devise_for :users
resources :teams do
  resources :players, shallow: true
end

root "teams#index"

end
