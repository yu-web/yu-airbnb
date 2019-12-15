CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        
    aws_access_key_id:      Rails.application.credentials.aws[:access_key_id],
    aws_secret_access_key:  Rails.application.credentials.aws[:secret_access_key],
    region:                'ap-northeast-1',                  
    host:                  's3-ap-northeast-1.amazonaws.com'
  }
  config.fog_directory  = 'yuairbnb'
end