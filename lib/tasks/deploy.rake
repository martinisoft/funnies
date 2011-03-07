namespace :deploy do
  task :create_rails_directories do
    puts "creating log/ and tmp/ directories"
    Dir.chdir(Rails.root)
    system("mkdir -p log tmp")
  end

  task :bundle_gems do
    puts "bundling..."
    Dir.chdir(Rails.root)
    system("bundle")
  end

  task :db_migrate do
    Rake::Task['db:migrate']
  end

  task :bounce_passenger do
    puts "restarting Passenger web server"
    Dir.chdir(Rails.root)
    system("touch tmp/restart.txt")
  end

  task :post_setup  => [ :create_rails_directories ]
  task :post_deploy => [ :bundle_gems, :db_migrate, :bounce_passenger ]
end
