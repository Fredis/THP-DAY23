class CommentsController < ApplicationController
before_action :find_commentable

  def edit
    @registration = Registration.find(params[:registration_id])
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def new
    @registration = Registration.find(params[:registration_id])
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.create!(content: params_from_form[:content], user_id: params[:registration_id].to_i, gossip_id: params[:gossip_id].to_i)
    redirect_to registration_gossips_path(params[:registration_id])
  end 

  def update
    @comment = Comment.find(params[:id])
  	@comment.update(params_from_form)
    redirect_to registration_gossips_path(params[:registration_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to registration_gossips_path(params[:registration_id])
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private 
  def params_from_form
    params.require(:comment).permit(:content)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Gossip.find_by_id(params[:gossip_id]) if params[:gossip_id]
  end

end
