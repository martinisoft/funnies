namespace :deploy do
  task :create_rails_directories do
    puts "creating log/ and tmp/ directories"
    Dir.chdir(Rails.root)
    system("mkdir -p log tmp")
  end

  task :db_migrate => :environment do
    Rake::Task['db:migrate'].invoke
  end

  task :restart_server do
    if ENV["RAILS_ENV"] == "staging"
      puts "restarting Passenger web server"
      Dir.chdir(Rails.root)
      system("touch tmp/restart.txt")
    else
      puts "restarting Unicorn"
      system("kill -s USR2 `cat /tmp/unicorn.funnies.pid`")
    end
  end

  task :stop_server do
    puts "stopping Unicorn"
    system("kill -s QUIT `cat /tmp/unicorn.funnies.pid`")
  end

  task :start_server do
    puts "starting Unicorn"
    Dir.chdir(Rails.root)
    system("bundle exec unicorn_rails -c config/unicorn.rb -D")
  end

  task :post_setup  => [ :create_rails_directories ]
  task :post_deploy => [ :db_migrate, :restart_server ]
end
