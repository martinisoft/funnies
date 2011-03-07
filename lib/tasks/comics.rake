namespace :comics do
  desc "Check all comics for updates"
  task :update => :environment do
    Comic.all.map(&:update_strip)
  end
end
