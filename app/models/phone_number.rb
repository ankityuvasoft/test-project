class PhoneNumber < ApplicationRecord
	def generate_pin
  	self.pin = rand(0000..9999).to_s.rjust(4, "0")
  	save
  end

  def verify(entered_pin)
  	update(verified: true) if self.pin == entered_pin
	end
	def twilio_client
  Twilio::REST::Client.new('ACab13cb5d576b2fbf2b476a53e62ef45f','54c8205a56f6b65b44db97de70c1c6ae')
  end

  def send_pin
 
  twilio_client.messages.create(
    to:  "+91#{phone_number}",
    from: +18317099213,
    body: "Your PIN is #{pin}"
  )
  end

end
 