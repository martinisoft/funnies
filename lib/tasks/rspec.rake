task :rspec do
  # Temporary change, bug in rspec causes turnip features to not be included
  # in the rspec task
  # ENV['SPEC_OPTS'] = "--format progress"
  # Rake::Task[:spec].invoke
  system "rspec --format Fivemat"
end
