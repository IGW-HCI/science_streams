class UserMailer < ApplicationMailer
  def welcome(user)
    @greeting = "Hi"

    mail to: user.email
  end

  def added_to_project(user)
    @greeting = "Hi"

    mail to: user.email
  end
end
