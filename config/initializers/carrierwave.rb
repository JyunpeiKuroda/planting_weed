require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# 環境ごとの保存先の条件分岐
CarrierWave.configure do |config|
  # 本番環境はGCP Cloud Storageに保存
  if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/google'
    config.fog_directory = "weedock-images-bucket"   # Cloud Storageのバケット名
    # iam_profile
    config.fog_credentials = {
      google_json_key_location: '/weedock/gcs.json',
      provider: "Google",
      project_name: "weedock-rails"
      # :google_json_key_location    =>
      # HMAC キー(アクセスID・シークレット)
      # :google_project                   => ""
      # :google_storage_access_key_id     => ""
      # :google_storage_secret_access_key => ""
      # :region                           => "asia-northeast1" #東京リージョン
    }
  else
    # 開発環境はlocalに保存
    config.storage :file
    config.enable_processing = false if Rails.env.test?   #test:処理をスキップ
  end
end