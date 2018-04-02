module ApplicationHelper

  def avatar_url(user)
    user.photo || "http://placehold.it/30x30"
  end

end
