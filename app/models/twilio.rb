def text_customer
 customer_phone_number = "13034789928" # in production, change to match @user.phone_number

 twilio_sid = ENV["TWILIO_SID"] 
 twilio_token = ENV["TWILIO_TOKEN"]
 twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]

 # set up a client to talk to the Twilio REST API
 @twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)

 @twilio_client.account.sms.messages.create(
   from: twilio_phone_number,
   to: customer_phone_number,
   body: "Confirm Your GPS location for AirDrop Delivery"
 )
end
