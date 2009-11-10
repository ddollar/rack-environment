require 'rake'
require 'rake/tasklib'
require 'rack_environment'

class RackEnvironment::Task < ::Rake::TaskLib

  def initialize(options={})
    rack_environment = RackEnvironment.new(options)

    task :rack_environment do
      rack_environment.update_environment!
    end
  end

end
