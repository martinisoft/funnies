require "pathname"
RAILS_ROOT = Pathname.new(File.expand_path("../..", __FILE__))

# ActiveSupport
require "active_support"
require "active_support/dependencies"
%w{ helpers mailers models }.each do |dir|
  ActiveSupport::Dependencies.autoload_paths <<
    File.expand_path("../../app/#{dir}", __FILE__)
end
