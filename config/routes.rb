Rails.application.routes.draw do
  root 'buzzer#index'
  get '/call', to: 'buzzer#buzz_answerer'
  get 'buzzer/buzz_handler', to: 'buzzer#buzz_handler'
  get 'buzzer/answering_machine', to: 'buzzer#answering_machine'
  get 'buzzer/handle_recorded_message', to: 'buzzer#handle_recorded_message'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
