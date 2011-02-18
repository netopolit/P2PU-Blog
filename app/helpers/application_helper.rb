module ApplicationHelper

  def title
    base_title = "Blog"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def owner?(user)
    user == current_user
  end

  def avatar_url(user)
    default_url = "#{root_url}images/no_avatar.jpg"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
  end

  def sanitize_wysiwyg(input)
    sanitize(input, :tags => %w(p strong em i b u strike  small sub sup ul ol li a img br pre code dl dt dd),
                    :attributes => %w(id class style href title src alt width height))

  end

end
