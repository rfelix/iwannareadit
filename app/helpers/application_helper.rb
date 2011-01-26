module ApplicationHelper
  def title(*parts)
    @title = (parts << "I Wanna Read It!").join(" - ") unless parts.empty?
    @title || "I Wanna Read It!"
  end

  def is_admin?
    @current_user && @current_user.is_admin
  end
end
