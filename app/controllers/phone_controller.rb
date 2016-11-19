require 'twilio-ruby'
class PhoneController < ApplicationController
  include Webhook

  after_filter :set_header
  skip_before_action :verify_authenticity_token

  def buzz_handler
  end

  def buzz_answerer
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'One moment..'
      r.Dial ENV['MY_NUMBER']
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
