class PhoneLog < ApplicationRecord
  def self.call(params)
    log = self.new(incoming_type: 'phone',
                from_country: params['FromCountry'],
                from_state: params['FromState'],
                from_city: params['FromCity'],
                status: params['CallStatus'],
                sid: params['CallSid'],
                phone_number: params['From'])

    log.save!
  end

  def self.sms(params)
    log = new(incoming_type: 'sms',
                from_country: params['FromCountry'],
                from_state: params['FromState'],
                from_city: params['FromCity'],
                status: params['SmsStatus'],
                body: params['Body'],
                sid: params['SmsMessageSid'],
                phone_number: params['From'])

    log.save!
  end
end
