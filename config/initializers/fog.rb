CarrierWave.configure do |config|
  config.fog_credentials = {
    :aws_access_key_id => Settings.AWS_KEY,
    :aws_secret_access_key => Settings.AWS_SECRET_KEY,
    :provider => 'AWS',
    :region => 'ap-northeast-1'
  }
  config.fog_directory = Settings.BUCKET_NAME
  config.fog_public = true
end