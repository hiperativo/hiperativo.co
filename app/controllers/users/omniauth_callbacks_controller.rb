class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	# http://impulso.lvh.me:12000/users/auth/twitter/callback
	def twitter
		auth = request.env["omniauth.auth"]
		# if user_signed_in?
		# 	@user = User.find(current_user)
		# 	@user.update_attributes uid: auth["uid"],
		# 		provider: auth["provider"],
		# 		nickname: auth["info"]["nickname"],
		# 		bio: auth["info"]["description"],
		# 		image_url: auth["info"]["image"],
		# 		token: auth["credentials"]["token"],
		# 		secret: auth["credentials"]["secret"]
		# else
			if User.where(uid: auth["uid"]).any?
				@user = User.where(uid: auth["uid"]).first
			else
				@user = User.create do |user|
					user.name = auth["info"]["name"]
					user.provider = "twitter"
					user.uid = auth["uid"]
					user.token = auth["credentials"]["token"]
					user.secret = auth["credentials"]["secret"]
					user.nickname = auth["info"]["nickname"]
					user.bio = auth["info"]["description"]
					user.image_url = auth["info"]["image"]
				end
			end
		# end
		sign_in_and_redirect @user
	end
end