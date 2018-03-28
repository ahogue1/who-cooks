module ApplicationHelper

  def avatar_url
    current_user.photo || "http://placehold.it/30x30"
  end

end
