namespace :comics do
  desc "Check all comics for updates"
  task update: :environment do
    Comic.all.each do |c|
      Rails.logger.info "[#{Time.now.to_s(:db)}] Update Comic: #{c.name}"
      c.update_strip
    end
  end
end
