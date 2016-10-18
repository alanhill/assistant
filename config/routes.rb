Rails.application.routes.draw do
  root 'assistant#index'
  post '/call', to: 'assistant#buzz_answerer'
  post 'assistant/buzz_handler', to: 'assistant#buzz_handler'
  post 'assistant/answering_machine', to: 'assistant#answering_machine'
  post 'assistant/handle_recorded_message', to: 'assistant#handle_recorded_message'
  post '/sms', to: 'assistant#sms'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
