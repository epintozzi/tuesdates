module GroupHelper

  def show_name_or_email_group(user)
    if user.first_name.nil?
      "#{user.email}"
    else
      "#{user.first_name} #{user.last_name}"
    end
  end

end
