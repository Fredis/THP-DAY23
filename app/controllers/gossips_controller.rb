class GossipsController < ApplicationController
 	
 	def new
  	@gossip = Gossip.new
  end

  def create
  	gossip = Gossip.create!(params_from_form)
  	redirect_to gossip_path(gossip.id)
  end

  def show
  	@gossip = Gossip.find(params[:id])
  end

  def index
  	@gossip = Gossip.all
  end

  def edit
  	@gossip = Gossip.find(params[:id])
  end

  def update
  	@gossip = Gossip.find(params[:id])
  	@gossip.update(params_from_form)
  	redirect_to gossips_path
  end

  def destroy
  	@gossip = Gossip.find(params[:id])
  	@gossip.destroy
  	redirect_to gossips_path
  end

  def params_from_form
  	return params.require(:gossip).permit(:anonymous_gossipeur, :content)
  end

end
