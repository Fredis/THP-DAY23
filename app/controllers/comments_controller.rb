class CommentsController < ApplicationController
  def edit
    @registration = Registration.find(params[:registration_id])
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def new
    puts "JE SUIS DANS NEW////////////////////////////////////////////////////////////////////////////////////////////// : #{params}"
    @registration = Registration.find(params[:registration_id])
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new
  end

  def create
    if params[:format] == "Gossip"
      @comment = Comment.create!(content: params_from_form[:content], user_id: params[:registration_id].to_i, commentable_type: "Gossip", commentable_id: params[:gossip_id] )
    else
      @comment = Comment.create!(content: params_from_form[:content], user_id: params[:registration_id].to_i, commentable_type: "Comments", commentable_id: params[:comment_id])
    end
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
  def params_from_form_format
    params.require(:comment).permit(:format)
  end

end
