# Funnies crontab file for updating comics

# Set log output directory to Rails log folder
set :output, "log/cron.log"

every 1.day, :at => '4:00 am' do
  rake "comics:update"
end
