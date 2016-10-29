OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
   provider :facebook, '1936948556533288', '90a121c13fe48790f02a85adf902a9aa'
end