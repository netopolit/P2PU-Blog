module ApplicationHelper

  def owner?(user)
    user == current_user
  end

  def avatar_url(user)
    default_url = "#{root_url}images/no_avatar.jpg"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end

end
