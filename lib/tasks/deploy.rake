namespace :deploy do
  task :create_rails_directories do
    puts "creating log/ and tmp/ directories"
    Dir.chdir(Rails.root)
    sh "mkdir -p log tmp"
  end

  task :db_migrate => :environment do
    Rake::Task['db:migrate'].invoke
  end

  task :restart_server do
    if File.exist?("/tmp/unicorn.funnies.pid")
      puts "restarting Unicorn"
      sh "kill -s USR2 `cat /tmp/unicorn.funnies.pid`"
    else
      puts "Unicorn pidfile is missing, starting Unicorn"
      Rake::Task['deploy:start_server'].invoke
    end
  end

  task :stop_server do
    if File.exist?("/tmp/unicorn.funnies.pid")
      puts "stopping Unicorn"
      sh "kill -s QUIT `cat /tmp/unicorn.funnies.pid`"
    else
      puts "Unicorn pidfile does not exist, is it running?"
    end
  end

  task :start_server do
    if File.exist?("/tmp/unicorn.funnies.pid")
      puts "Unicorn pidfile exists, is it started already?"
    else
      puts "starting Unicorn"
      Dir.chdir(Rails.root)
      sh "bundle exec unicorn_rails -c config/unicorn.rb -D"
    end
  end

  task :post_setup  => [ :create_rails_directories, :start_server ]
  task :post_deploy => [ :db_migrate, :restart_server ]
end
