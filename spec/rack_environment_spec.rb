require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RackEnvironment" do
  include Rack::Test::Methods

  def rack_environment_with_filename(filename)
    Rack::Builder.new do
      use RackEnvironment, :file => File.join(File.dirname(__FILE__), 'config', filename)
      run TestApplication.new
    end
  end

  def rack_environment_with_environment(environment)
    Rack::Builder.new do
      use RackEnvironment, :environment => environment
      run TestApplication.new
    end
  end

  before :each do
    get "/"
    @environment = last_response.headers['X-Rack-Environment']
  end

  describe "with specified environment" do
    def app
      rack_environment_with_environment :ONE => 'one_value'
    end

    it "should have the proper environment set" do
      @environment['ONE'].should == 'one_value'
    end
  end

  describe "with specified config file" do
    def app
      rack_environment_with_filename 'environment.yml'
    end

    it "should have the proper environment set" do
      @environment['UPPER'].should == 'upper_value'
    end

    it "should uppercase environment variables" do
      @environment['lower'].should_not == 'lower_value'
      @environment['LOWER'].should     == 'lower_value'
    end
  end

  describe "with blank config file" do
    def app
      rack_environment_with_filename 'blank.yml'
    end

    it "should not raise an error" do
      @environment.should_not be_nil
    end
  end

end
