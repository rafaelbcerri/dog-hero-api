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

    resources :dog_walkings do
      post '/start_walk', to: 'dog_walkings#start_walk'
      post '/finish_walk', to: 'dog_walkings#finish_walk'
    end

    put 'users/:id', to: 'users#update'
    get 'users/:id/dog_walkings', to: 'users#get_dog_walkings'

    mount Raddocs::App => '/docs'
end
