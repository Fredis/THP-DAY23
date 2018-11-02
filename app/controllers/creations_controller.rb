class CreationsController < ApplicationController
  def new
  end
  
  def create
    User.create!(creation_params)
    redirect_to root_path
  end
  
  private

  def creation_params
    params.permit(:email, :password, :first_name, :last_name, :description)
  end
end
