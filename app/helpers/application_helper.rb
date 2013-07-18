module ApplicationHelper
	require 'digest/md5'

	def markdown(string)
		options = {lax_spacing: true, hard_wrap: true}
		renderer = Redcarpet::Render::HTML.new(options)
		Redcarpet::Markdown.new(renderer).render(string).html_safe
	end

	def avatar(user, size=nil, options={})
		hash = Digest::MD5.hexdigest(user.email.downcase)
		image_tag("http://www.gravatar.com/avatar/#{hash}?s=#{size}", options)
	end
end
