task :rspec do
  ENV['SPEC_OPTS'] = "--format progress"
  Rake::Task[:spec].invoke
end
