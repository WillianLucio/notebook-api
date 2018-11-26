Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :auths, only: [:create]
  resources :kinds

  scope module: 'v1' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "1" } do
      resource :kind, only: :show
      resource :kind, only: :show, path: 'relationships/kind'

      resource :phones, only: :show
      resource :phones, only: :show, path: 'relationships/phones'
      resource :phone, only: %i(update create destroy)
      resource :phone, only: %i(update create destroy), path: 'relationships/phones'

      resource :address, only: %i(show update create destroy)
      resource :address, only: %i(show update create destroy), path: 'relationships/address'
    end
  end

  scope module: 'v2' do
    resources :contacts, :constraints => lambda { |request| request.params[:version] == "2" } do
      resource :kind, only: :show
      resource :kind, only: :show, path: 'relationships/kind'

      resource :phones, only: :show
      resource :phones, only: :show, path: 'relationships/phones'
      resource :phone, only: %i(update create destroy)
      resource :phone, only: %i(update create destroy), path: 'relationships/phones'

      resource :address, only: %i(show update create destroy)
      resource :address, only: %i(show update create destroy), path: 'relationships/address'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
