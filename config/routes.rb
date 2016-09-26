Rails.application.routes.draw do
  root 'buzzer#index'
  get 'buzzer/buzz_answerer', to: '/call'
  get 'buzzer/buzz_handler'
  get 'buzzer/answering_machine'
  get 'buzzer/handle_recorded_message'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
