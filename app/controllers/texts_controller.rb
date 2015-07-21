class TextsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @texts = Text.all
    message_body = params["Body"]
    from_number = params["From"]

  end

  def new
    @text = Text.new
    @contacts = Contact.all
  end


  def create
    twilio_sid = "ACae2ec4ec4b2f7d01251c2be94964ff7e"
    twilio_token = "e67d005d04108d0e09e707a1f6ec6f63"
    twilio_phone_number ="+15033749324"
    all_messages = []
    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

    messages = messages_params(params)
    messages.each do |key, value|
      @twilio_client.account.sms.messages.create(
      from: twilio_phone_number,
      to: value,
      body: params[:text].first.at(1)
      )
      text = Text.create(number_to_send_to)
      to_number = "+1" + value
      body = params[:text].first.at(1)
    end
    #
    # @text = Text.create(number_to_send_to)
    # to_number = "+1" + @text.to_number
    # body = @text.body

    redirect_to texts_path
  end

  def messages_params(params)
    @messages = params.flatten.slice(4..(params.flatten.length - 9))
    @messages = Hash[*@messages]
    return @messages
  end

  # def send_text_message
  #   number_to_send_to = params[:number_to_send_to]
  #
  #   twilio_sid = "AC52afaf4420645a8cdb686fd6ce111062"
  #   twilio_token = "392ec8487afaaf7ad7a2deb65b8adb55"
  #   twilio_phone_number ="+15005550006"
  #
  #   @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
  #   @twilio_client.account.sms.messages.create(
  #   from: "#{twilio_phone_number}",
  #   to: number_to_send_to,
  #   body: "Test Message from testing"
  #   )
  # end

  private


    def number_to_send_to
      params.require(:text).permit(:to_number, :body)
    end

end


# 5033749324
