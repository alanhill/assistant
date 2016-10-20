Rails.application.routes.draw do
  get 'home/index'

  root 'phone#index'
  post '/call', to: 'phone#buzz_answerer'
  post 'phone/buzz_handler', to: 'phone#buzz_handler'
  post 'phone/answering_machine', to: 'phone#answering_machine'
  post 'phone/handle_recorded_message', to: 'phone#handle_recorded_message'
  post '/sms', to: 'phone#sms'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
