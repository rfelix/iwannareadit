module ApplicationHelper
  def title(*parts)
    @title = (parts << "I Wanna Read It!").join(" - ") unless parts.empty?
    @title || "I Wanna Read It!"
  end
end
