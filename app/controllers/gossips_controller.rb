class GossipsController < ApplicationController
 	
 	def new
    @registration = Registration.find(params[:registration_id])
  	@gossip = Gossip.new
  end

  def create
  	gossip = Gossip.create!(content: params_from_form[:content], user_id: params[:registration_id].to_i)
    redirect_to registration_gossips_path(params[:registration_id])
  end

  def show
  	@gossip = Gossip.find(params[:id])
  end

  def index
  	@gossip = Gossip.all
  end

  def edit
    @registration = Registration.find(params[:registration_id])
    @gossip = Gossip.find(params[:id])
  end

  def update
  	@gossip = Gossip.find(params[:id])
  	@gossip.update(params_from_form)
    redirect_to registration_gossips_path(params[:registration_id])
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to registration_gossips_path(params[:registration_id])
  end

  def params_from_form
    params.require(:gossip).permit(:content)
  end

end
