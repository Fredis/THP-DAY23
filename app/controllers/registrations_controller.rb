class RegistrationsController < ApplicationController
  def new
    @registration =  Registration.new
  end

  def create
    @registration = Registration.create(registration_params)
    instance_checking = Registration.new 
    if instance_checking.check(@registration)
      redirect_to registration_gossips_path(User.find_by(email: "#{registration_params[:email]}").id)
    else
      redirect_to 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
    end
  end

  private
  def registration_params
    params.require(:registration).permit(:email, :password)
  end
end
