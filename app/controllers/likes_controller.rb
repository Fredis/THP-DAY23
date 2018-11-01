class LikesController < ApplicationController
  def new
  end

  def create
    @likes = Like.create!(user_id: User.find_by(email: Registration.find(params[:registration_id].to_i).email).id, gossip_id: params[:gossip_id])
    redirect_to registration_gossip_path(params[:registration_id], params[:gossip_id])
  end

  def delete
  end
end
