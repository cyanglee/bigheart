CarrierWave.configure do |config|
  config.fog_credentials = {
    :aws_access_key_id => ENV['AWS_KEY'],
    :aws_secret_access_key => ENV['AWS_SECRET_KEY'],
    :provider => 'AWS',
    :region => 'ap-northeast-1'
  }
  config.fog_directory = ENV['BUCKET_NAME']
  config.fog_public = true
end