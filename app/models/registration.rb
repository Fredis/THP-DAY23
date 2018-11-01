class Registration < ApplicationRecord
  def check(registration)
    if User.find_by(email: "#{registration.email}") == nil
      return false 
    end 
    if registration.password == User.find_by(email: "#{registration.email}").password
      return true
    end
    return false
  end
end
