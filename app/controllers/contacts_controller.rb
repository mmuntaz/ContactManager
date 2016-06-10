require 'open-uri'
class ContactsController < ApplicationController
  def index
    @contacts = current_user.contacts
    @interacts = current_user.interacts
  end

  def address_to_geo(address)
    url = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + URI.encode(address)
    parsed_data = JSON.parse(open(url).read)
    lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    lng = parsed_data["results"][0]["geometry"]["location"]["lng"]
    return [lat,lng]
  end

  def map
    @contacts = Contact.where({:user_id => current_user.id})
  end

  def all
    @q = Contact.where({:user_id => current_user.id}).ransack(params[:q])
    @contacts = @q.result
  end
  def calender
    #code
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    check = params[:caddress]
    if params[:caddress] ==""
      params[:caddress] = "New York NY"
    end
    @contact = Contact.new
    @contact.cfname = params[:cfname]
    @contact.clname = params[:clname]
    @contact.cemail = params[:cemail]
    @contact.cdob = params[:cdob]
    @contact.caddress = params[:caddress]
    @contact.cphone = params[:cphone]
    @contact.ccompany = params[:ccompany]
    @contact.cindustry = params[:cindustry]
    @contact.cinterest = params[:cinterest]
    @contact.crelation = params[:crelation]
    @contact.cnote = params[:cnote]
    @contact.user_id = params[:user_id]
    latlng = address_to_geo(params[:caddress])
    @contact.lat = latlng[0]
    @contact.lng = latlng[1]
    if check == ""
      @contact.caddress = ""
    end

    if @contact.save
      redirect_to "/", :notice => "Contact created successfully."
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    check = params[:caddress]
    if params[:caddress] ==""
      params[:caddress] = "New York NY"
    end
    @contact = Contact.find(params[:id])
    @contact.cfname = params[:cfname]
    @contact.clname = params[:clname]
    @contact.cemail = params[:cemail]
    @contact.cdob = params[:cdob]
    @contact.caddress = params[:caddress]
    @contact.cphone = params[:cphone]
    @contact.ccompany = params[:ccompany]
    @contact.cindustry = params[:cindustry]
    @contact.cinterest = params[:cinterest]
    @contact.crelation = params[:crelation]
    @contact.cnote = params[:cnote]
    @contact.user_id = params[:user_id]
    latlng = address_to_geo(params[:caddress])
    @contact.lat = latlng[0]
    @contact.lng = latlng[1]
    if check == ""
      @contact.caddress = ""
    end

    if @contact.save
      redirect_to "/", :notice => "Contact updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @interact = Interact.where({:contact_id => @contact.id})
    @contact.destroy
    @interact.delete_all

    redirect_to "/", :notice => "Contact deleted."
  end
end
