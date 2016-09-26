require 'twilio-ruby'
class BuzzerController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token
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

    render_twiml response
  end

    def buzz_answerer
      response = Twilio::TwiML::Response.new do |r|
        r.Say "Hello!"
        r.Play 'http://demo.twilio.com/hellomonkey/monkey.mp3'
        r.Gather :numDigits => '4', :action => '/buzzer/buzz_handler', :method => 'post' do |g|
          g.Say 'Enter the code if you have it'
          g.Say 'Or press 0000 to reach me if you do not'
        end
      end

      render_twiml response
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
