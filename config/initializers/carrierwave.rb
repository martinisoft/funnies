CarrierWave.configure do |config|
  config.storage = :file

  if Rails.env.test? || Rails.env.cucumber?
    config.enable_processing = false
  end
end
