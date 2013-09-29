module ApplicationHelper
  def user_name
    session["devise.user_data"][:info][:name]    
  end

  def user_email
    session["devise.user_data"][:info][:email]    
  end
    
end
