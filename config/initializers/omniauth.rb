OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  fb_config = Rails.application.config_for(:facebook)
  provider :facebook, fb_config['app_id'], fb_config['secret']

end