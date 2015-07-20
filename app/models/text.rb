class Text < ActiveRecord::Base
  # before_create :send_text_message
#
private
#   def send_sms
#     resposne = RestClient::Request.new(
#       method: :post,
#       url:
#       user:
#       password:
#       payload: {
#         Body: body,
#         From: from,
#         To: to
#       }.execute
#     )
#   end

# def send_text_message
#   # number_to_send_to = params[number_to_send_to]
#
#   twilio_sid = "PNc027046aec87348e8dd94ee7e9d27d55"
#   twilio_token = "e67d005d04108d0e09e707a1f6ec6f63"
#   twilio_phone_number ="+15005550006"
#
#   @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
#   @twilio_client.account.sms.messages.create(
#   from: "5033749324",
#   to: "5035474491",
#   body: "Test Message from testing"
#   )
# end
#
# def number_to_send_to
#   params.require(:text).permit(:to_number)
# end


end
