module ApplicationHelper

  def owner?(user)
    user == current_user
  end

  def avatar_url(user)
    default_url = "#{root_url}images/no_avatar.jpg"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end

  def sanitize_wysiwyg(input)
    sanitize(input, :tags => %w(p strong em ul ol li a img ),
                    :attributes => %w(id class style href title src alt width height))

  end

end
