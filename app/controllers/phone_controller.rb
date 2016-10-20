require 'twilio-ruby'
class PhoneController < ApplicationController
  include Webhook

  after_filter :set_header
  skip_before_action :verify_authenticity_token

  def index
  end

  def buzz_handler
    redirect_to '/call' unless params['Digits'].present?

    if params['Digits'] == '1'
      response = Twilio::TwiML::Response.new do |r|
        r.Say 'Testing..'
        r.Dial '9'
      end
    elsif params['Digits'] == '0'
      response = Twilio::TwiML::Response.new do |r|
        r.Say 'One moment..'
        r.Dial ENV['MY_NUMBER']
      end
    end

    render_twiml response
  end

  def buzz_answerer
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Hello!"
      r.Gather numDigits: '1', action: '/phone/buzz_handler', method: 'post'
  end

  render_twiml response
  end

  def answering_machine
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Hey you've reached Alan but I can't get ya at the moment, leave a message!"
      r.Record maxLength: '60', action: '/phone/handle-recorded-message'
    end
  end

  def handle_recorded_message
    response = Twilio::TwiML::Response.new do |r|
      r.Say "Thanks! I'll get back to you when I can"
    end
  end

  def sms
    body = params['Body'].downcase

    response = Twilio::TwiML::Response.new do |r|
      weather = Assistant.new.weather
      r.Message "#{weather}" if body == 'weather'
    end

    render_twiml response
  end
end
