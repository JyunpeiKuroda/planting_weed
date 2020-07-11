require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Weedock
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
        # 以下を追加すれば日本語に
    config.i18n.default_locale = :ja
        # タイムゾーンも変更するなら，以下を追加
    config.time_zone = 'Asia/Tokyo'
        # 別の画像プロセッサとしてlibvipsを使う
    config.active_storage.variant_processor = :vips
  end
end
