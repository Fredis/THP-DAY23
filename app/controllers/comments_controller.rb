class CommentsController < ApplicationController
  def edit
  end

  def new
    @registration = Registration.find(params[:registration_id])
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.create!(content: params_from_form[:content], user_id: params[:registration_id].to_i, gossip_id: params[:gossip_id].to_i)
    redirect_to registration_gossips_path(params[:registration_id])
  end 

  def update
  end

  def destroy
  end

  def show
  end

  private 
  def params_from_form
    params.require(:comment).permit(:content)
  end

end
