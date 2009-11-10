class RackEnvironment

  attr_reader :app, :options

  def initialize(app, options={})
    @app     = app
    @options = options
  end

  def call(env)
    update_environment!
    app.call(env)
  end

  def update_environment!
    environment.each do |key, value|
      ENV[key] = value
    end
  end

private ######################################################################

  def default_config_file
    File.join(Dir.getwd, 'config', 'environment.yml')
  end

  def environment
    normalize case
      when options[:environment] then options[:environment]
      when options[:file]        then read_config_file(options[:file])
      else read_config_file(default_config_file)
    end
  end

  def normalize(environment)
    environment.inject({}) do |hash, (key, value)|
      hash.update(key.to_s.upcase => value)
    end
  end

  def read_config_file(filename)
    config = YAML::load_file(filename)
    config.is_a?(Hash) ? config : {}
  end

end
