module ApplicationHelper
	require 'digest/md5'

	def markdown(string)
		Maruku.new(string).to_html.html_safe
	end

	def avatar(user, size=nil, options={})
		hash = Digest::MD5.hexdigest(user.email.downcase)
		image_tag("http://www.gravatar.com/avatar/#{hash}?s=#{size}", options)
	end
end
