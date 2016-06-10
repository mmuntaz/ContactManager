class InteractsController < ApplicationController
  def index
    @interacts = current_user.interacts
  end

  def show
    @interact = Interact.find(params[:id])
  end

  def new
    @interact = Interact.new
  end

  def create
    @interact = Interact.new
    @interact.ititle = params[:ititle]
    @interact.ibody = params[:ibody]
    @interact.idate = Chronic.parse(params[:idate])
    @interact.contact_id = params[:contact_id]

    if @interact.save
      redirect_to "/interacts", :notice => "Interact created successfully."
    else
      render 'new'
    end
  end

  def edit
    @interact = Interact.find(params[:id])
  end

  def update
    @interact = Interact.find(params[:id])
    @interact.ititle = params[:ititle]
    @interact.ibody = params[:ibody]
    @interact.idate = Chronic.parse(params[:idate])
    @interact.contact_id = params[:contact_id]
    if @interact.save
      redirect_to "/", :notice => "Interact updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @interact = Interact.find(params[:id])

    @interact.destroy

    redirect_to "/", :notice => "Interaction deleted."
  end
end
