if Rails.env.development?
  ENV['ACCOUNT_SID'] = 'abc123'
  ENV['AUTH_TOKEN'] = 'abc123'
end
@client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
