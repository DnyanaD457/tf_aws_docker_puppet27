require 'rspec/core/rake_task'


RSpec::Core::RakeTask.new(:beaker) do |config|
    puts 'dont use beaker, use beaker_roles:<role> or all_roles instead'
    abort
end   


namespace :beaker_roles do
    # find all acceptance tests
    Dir.glob("spec/acceptance/*_spec.rb") do |acceptance_test|
      # find role part of file name
      test_name = acceptance_test.split('/').last.split('_spec').first
      RSpec::Core::RakeTask.new(test_name) do |t|
        t.rspec_opts = ['--color']
        t.pattern = acceptance_test
      end
    end
  end

    
