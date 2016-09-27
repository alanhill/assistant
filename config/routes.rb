Rails.application.routes.draw do
  root 'buzzer#index'
  post '/call', to: 'buzzer#buzz_answerer'
  post 'buzzer/buzz_handler', to: 'buzzer#buzz_handler'
  post 'buzzer/answering_machine', to: 'buzzer#answering_machine'
  post 'buzzer/handle_recorded_message', to: 'buzzer#handle_recorded_message'
  post '/sms', to: 'buzzer#sms'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
