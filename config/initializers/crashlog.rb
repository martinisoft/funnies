if Rails.env.production? || Rails.env.staging?
  CrashLog.configure do |config|
    config.api_key = ENV['CRASHLOG_API_KEY']
    config.secret = ENV['CRASHLOG_SECRET']
  end
end
