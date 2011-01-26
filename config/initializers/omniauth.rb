require 'openid/store/filesystem'

# :domain can be specified here so that google doesn't ask you which domain to use
Rails.application.config.middleware.use OmniAuth::Strategies::GoogleApps,
                                        OpenID::Store::Filesystem.new('./tmp')

Rails.application.config.middleware.use OmniAuth::Strategies::OpenID,
                                        OpenID::Store::Filesystem.new('./tmp'),
                                        :name => 'google',
                                        :identifier => 'https://www.google.com/accounts/o8/id'
