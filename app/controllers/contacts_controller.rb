class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render new
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @text = Text.new
  end

  def update
    @contact = Contact.find(params[:id])
    @text = Text.create(number_to_send_to)
    twilio_sid = "ACae2ec4ec4b2f7d01251c2be94964ff7e"
    twilio_token = "e67d005d04108d0e09e707a1f6ec6f63"
    twilio_phone_number ="+15033749324"

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    @twilio_client.account.sms.messages.create(
    from: twilio_phone_number,
    to: "+1#{@contact.number}",
    body: "#{@text.body}"
    )
    redirect_to contact_path(@contact)
  end

private

  def contact_params
    params.require(:contact).permit(:name, :number)
  end

  def number_to_send_to
    params.require(:text).permit(:to_number, :body)
  end
end
