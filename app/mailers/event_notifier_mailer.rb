class EventNotifierMailer < ApplicationMailer

  def inform(user, invitee_contact)
    @user = user
    mail(to: invitee_contact, subject: "You have been invited on a Tuesdate!")
  end

end
