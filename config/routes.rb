Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }

    resources :dog_walkings, :path => '/dog-walkings' do
      post '/start-walk', to: 'dog_walkings#start_walk'
      post '/finish-walk', to: 'dog_walkings#finish_walk'
    end

    get 'pet-owner/:id/dog-walkings', to: 'users#get_pet_owner_dog_walkings'
    get 'walker/:id/dog-walkings', to: 'users#get_walker_dog_walkings'
    get 'users/:id/dogs', to: 'users#get_dogs'

    mount Raddocs::App => '/docs'
end
