require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :application, "funnies"
set :domain, 'funniesapp.com'
set :deploy_to, -> { "/srv/#{application}" }
set :repository, 'git://github.com/martinisoft/funnies.git'
set :branch, 'master'
set :user, -> { "#{application}" }

# Foreman related
set :runit_app_name, -> { "#{application}_#{rails_env}" }
set :runit_sv_path, -> { "#{shared_path}/sv" }
set :runit_service_path, -> { "#{deploy_to}/service" }
set :all_services, -> { "#{runit_service_path}/#{runit_app_name}-*" }

# Commented out for future use
# require 'foreman'
# require 'foreman/procfile'
# namespace :foreman do
#   desc "[internal] Copies env from shared path into current_path as .env"
#   task :cp_env do
#     run "cp #{shared_path}/env #{current_release}/.env"
#   end

#   desc "Exports runit process file"
#   task :export do
#     svp = runit_sv_path

#     run [
#       "svp=#{svp} &&",
#       "cd #{fetch(:current_release)} &&",
#       "if [ -f Procfile ] ; then",
#         # create an empty staging directory for services
#         "rm -rf ${svp}-pre &&",
#         "mkdir -p ${svp}-pre &&",

#         # export services into a *-pre directory
#         "#{fetch(:foreman_cmd)} export runit",
#           "${svp}-pre",
#           "--app=#{fetch(:runit_app_name)}",
#           "--log=#{fetch(:shared_path)}/log",
#           "--template=#{fetch(:user_home)}/.foreman/templates",
#           "--user=#{fetch(:user)} >/dev/null &&",

#         # fix any path references in files back to :runit_sv_path
#         # and ensure that a non-zero sed exit doesn't propagate
#         "egrep -lr ${svp}-pre ${svp}-pre | (xargs",
#           "sed -i \"s|${svp}-pre|${svp}|g\" 2>/dev/null || true) &&",

#         # calculate checksums of all service files in both
#         # service directories
#         "(cd ${svp} ; find . -path '*/supervise' -type d",
#           "-prune -o -type f | grep -v 'supervise$' | sort |",
#           "xargs openssl sha) > /tmp/sv-dir-$$ &&",
#         "(cd ${svp}-pre ; find . -path '*/supervise' -type d",
#           "-prune -o -type f | grep -v 'supervise$' | sort |",
#           "xargs openssl sha) > /tmp/sv-pre-dir-$$ &&",

#         "if diff -q /tmp/sv-dir-$$ /tmp/sv-pre-dir-$$ >/dev/null ; then",
#           "echo '-----> Foreman export atrifacts are identical' &&",
#           "rm -rf ${svp}-pre",

#         "; else", # diff -q
#           "echo '-----> Updated Foreman export artifacts detected' &&",
#           "echo '-----> Stoping processes' &&",
#           "rm -f #{fetch(:all_services)} &&",
#           "echo '-----> Installing updated Foreman export artifacts' &&",
#           "rm -rf ${svp} && mv ${svp}-pre ${svp} &&",
#           "touch ${svp}/.symlink_boot",
#         "; fi &&", # diff -q

#         # clean checksum calculations
#         "echo '-----> Cleaning up' &&",
#         "rm -f /tmp/sv-{dir,pre-dir}-$$",

#       "; else", # -f Procfile
#         # die with a warning about including a Procfile
#         "echo '>>>> A Procfile must exist in this project.' && exit 10",
#       "; fi" # -f Procfile
#     ].join(' ')
#   end

#   desc "[internal] Registers services to runit"
#   task :register do
#     symlink_boot = capture([
#       "if [ -f #{fetch(:runit_sv_path)}/.symlink_boot ] ; then",
#       "echo true",
#       "; else",
#       "echo false",
#       "; fi"
#     ].join(' ')).chomp

#     # if the service symlinks are fresh, this will start the
#     # service automatically so we won't try to pile on and
#     # call foreman:start or foreman:restart
#     if symlink_boot == "true" && callbacks[:after]
#       callbacks[:after].reject! { |c| c.source == "foreman:start" }
#       callbacks[:after].reject! { |c| c.source == "foreman:restart" }
#     end

#     run [
#       "ln -snf #{fetch(:runit_sv_path)}/*",
#       "#{fetch(:runit_service_path)}/ &&",
#       "rm -f #{fetch(:runit_sv_path)}/.symlink_boot"
#     ].join(' ')
#   end

#   namespace :start do
#     desc "Starts all processes"
#     task :default do
#       run [
#         "sv start #{fetch(:all_services)}",
#         "(s=$? && echo \"Start exited with $s\" && exit $s)"
#       ].join(' || ')
#     end
#   end

#   namespace :stop do
#     desc "Stops all services"
#     task :default do
#       run [
#         "sv stop #{fetch(:all_services)}",
#         "(s=$? && echo \"Stop exited with $s\" && exit $s)"
#       ].join(' || ')
#     end
#   end

#   namespace :restart do
#     desc "Restarts all services"
#     task :default do
#       run [
#         "sv restart #{fetch(:all_services)}",
#         "(s=$? && echo \"Restart exited with $s\" && exit $s)"
#       ].join(' || ')
#     end
#   end

#   desc "Procs"
#   task :ps do
#     run [
#       "sv status #{fetch(:all_services)}",
#       "(s=$? && echo \"Status exited with $s\" && exit $s)"
#     ].join(' || ')
#   end
# end

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'log', 'tmp/sockets', 'tmp/pids']

# This task is the environment that is loaded for most commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use[ruby-1.9.3-p194@funnies]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/sv"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/sv"]

  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/sockets"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/sockets"]

  queue! %[mkdir -p "#{deploy_to}/shared/tmp/pids"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/tmp/pids"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[-----> Be sure to edit 'shared/config/database.yml'.]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      queue "sv restart "
    end
  end
end

