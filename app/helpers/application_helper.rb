module ApplicationHelper

  def avatar_url(user)
    return "#{user.facebook_photo}&height=50&width=50" if user.facebook_photo
    user.photo_url(:thumb) || "http://placehold.it/30x30"
  end

end
