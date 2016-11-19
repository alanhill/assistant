Rails.application.routes.draw do
  resources :to_do
  get 'home/index'
  get 'todos', to: 'to_do#html_index'
  get 'log_viewer/index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  root 'home#index'
  post '/call', to: 'phone#buzz_answerer'
  post 'phone/buzz_handler', to: 'phone#buzz_handler'
  post 'phone/answering_machine', to: 'phone#answering_machine'
  post 'phone/handle_recorded_message', to: 'phone#handle_recorded_message'
  post '/sms', to: 'phone#sms'

  get '/auth/:provider/callback', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
