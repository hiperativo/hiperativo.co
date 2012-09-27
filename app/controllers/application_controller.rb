class ApplicationController < ActionController::Base
	protect_from_forgery
	include Mobylette::RespondToMobileRequests
	
	mobylette_config do |config|
		config[:fallback_chains] = { mobile: [:mobile, :html] }
		config[:skip_xhr_requests] = false
	end
	# before_filter :prepare_for_mobile

	# private

	# def mobile?
	# 	unless session[:mobile].nil?
	# 		session[:mobile] == "1"
	# 	else 
	# 		false
	# 	end
	# end

	# helper_method :mobile?

	# def prepare_for_mobile
	# 	session[:mobile] = params[:mobile] unless params[:mobile].nil?
	# 	request.format = :mobile if mobile?
	# end

end
