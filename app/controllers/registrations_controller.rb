class RegistrationsController < ApplicationController
  def new
    @registration =  Registration.new
  end

  def create
    @registration = Registration.create(registration_params)
    if Registration.check(@registration)
      redirect_to root_path
    else
      redirect_to 'https://google.com'
    end
  end

  private
  def registration_params
    params.require(:registration).permit(:email, :password)
  end
end
