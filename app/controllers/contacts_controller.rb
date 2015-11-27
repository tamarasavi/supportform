class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to root_url
      flash[:notice] = 'Thank you for your message. We will contact you soon! Täname teie kirja eest. Vastame esimesel võimalusel!'
    else
      redirect_to root_url
      flash[:error] = 'Cannot send message. Please try again. Kiri ei olnud saadetud. Palun proovige veel kord.'
    end
  end
end