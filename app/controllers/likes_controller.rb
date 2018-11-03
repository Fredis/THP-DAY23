class LikesController < ApplicationController
  def new
  end

  def create
    @likes = Like.create!(user_id: User.find(params[:registration_id]).id, gossip_id: params[:gossip_id])
    redirect_to registration_gossip_path(params[:registration_id], params[:gossip_id])
  end

  def destroy
    @likes = Like.find(params[:id])
    @likes.destroy
    redirect_to registration_gossip_path(params[:registration_id], params[:gossip_id])
  end
end
