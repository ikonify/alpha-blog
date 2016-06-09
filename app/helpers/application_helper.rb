module ApplicationHelper
  def gravatar_for(user, options = {size: 80})
    # Gravatar images are stored as MD5 hashes of the user emails
    # gravatar_id gets the MD5 hash of users email
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end
end
