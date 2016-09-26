class BuzzerController < ApplicationController
  # set up a client to talk to the Twilio REST API
  @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])

  def index
  end

  def buzz_handler
    redirect_to '/call' unless %w(1010 0000).include?(params['Digits'])

    if params['Digits'] == '1010'
      response = Twilio::TwiML::Response.new do |r|
        r.Dial '1'
        r.Say 'The call failed or the remote party hung up. Goodbye.'
      end
    elsif params['Digits'] == '0000'
      response = Twilio::TwiML::Response.new do |r|
        r.Say 'Dialing Alan'
        r.Dial ENV['MY_NUMBER']
      end
    end
    response.text
  end

  def buzz_answerer
    Twilio::TwiML::Response.new do |r|
      r.Say 'Hello!'
    end.text
  end

  def answering_machine
    Twilio::TwiML::Response.new do |r|
      r.Say "Hey you've reached Alan but I can't get ya at the moment, leave a message!"
      r.Record maxLength: '30', action: '/buzzer/handle-recorded-message'
    end.text
  end

  def handle_recorded_message
    Twilio::TwiML::Response.new do |r|
      r.Say "Thanks! I'll get back to you when I can"
    end
  end
end
