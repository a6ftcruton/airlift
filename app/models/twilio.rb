 put your own credentials here
 twilio_sid = ENV["TWILIO_SID"] 
 twilio_token = ENV["TWILIO_TOKEN"]
 twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]

 # set up a client to talk to the Twilio REST API
 @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

 # alternatively, you can preconfigure the client like so
 Twilio.configure do |config|
   config.account_sid = account_sid
     config.auth_token = auth_token
     end

     # and then you can create a new client without parameters
     @client = Twilio::REST::Client.new
