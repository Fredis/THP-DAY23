class Registration < ApplicationRecord
  def Registration.check(registration)
      if registration.password == User.find_by(email: "#{registration.email}").password
        return true
      end
    return false
  end
end
