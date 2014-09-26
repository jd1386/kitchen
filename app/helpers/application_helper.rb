module ApplicationHelper

	def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase unless user.blank?
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

# check if the given url has http protocol and if not, append it  
  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end

  def full_name_of(user)
  	user.first_name + ' ' + user.last_name unless user.first_name.blank? && user.last_name.blank?
  end

end
