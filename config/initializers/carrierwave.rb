require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'rails-s3photo'
    config.asset_host = 'https://rails-s3photo.s3.amazonaws.com'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAUGFDMTKPJXZ3ARWW',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1'
      path_style: true
    }
    
    config.fog_public     = false 
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
   
  
  end