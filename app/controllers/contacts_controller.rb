class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to root_url
      flash[:notice] = 'Teie kiri oli saadetud Inbank Tech IT klienditoele. Teie e-posti aadressile varsti tuleb kiri koos teie päringu numbriga. Vastame teile esimesel võimalusel.'
    else
      redirect_to root_url
      flash[:error] = 'Kiri ei olnud saadetud. Palun proovige veel kord.'
    end
  end
end