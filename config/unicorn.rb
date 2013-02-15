# config/unicorn.rb
base_directory = "/srv/funnies"
shared_directory = "#{base_directory}/shared"
working_directory "#{base_directory}/current"

pid "#{shared_directory}/pids/unicorn.pid"
stderr_path "#{shared_directory}/log/unicorn.log"
stdout_path "#{shared_directory}/log/unicorn.log"

listen "#{shared_directory}/sockets/unicorn.sock"
worker_processes 2 # amount of unicorn workers to spin up
timeout 30         # restarts workers that hang for 30 seconds

preload_app true

before_fork do |server, worker|
  # Disconnect since the database connection will not carry over
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
    Rails.logger.info('Disconnected from ActiveRecord')
  end

  # Quit the old unicorn process
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end

end

after_fork do |server, worker|
  # Start up the database connection again in the worker
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
    Rails.logger.info('Connected to ActiveRecord')
  end

end
