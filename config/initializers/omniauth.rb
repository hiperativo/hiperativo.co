Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.logger = Rails.logger
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end