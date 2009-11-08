require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RackEnvironment" do
  include Rack::Test::Methods

  before :each do
    get "/"
    @environment = last_response.headers['X-Rack-Environment']
  end

  describe "with specified config file" do
    def app
      Rack::Builder.new do
        use RackEnvironment, :file => File.expand_path(File.dirname(__FILE__) + '/config/environment.yml')
        run TestApplication.new
      end
    end

    it "should have the proper environment set" do
      @environment['UPPER'].should == 'upper_value'
    end

    it "should uppercase environment variables" do
      @environment['lower'].should_not == 'lower_value'
      @environment['LOWER'].should     == 'lower_value'
    end
  end

  describe "with specified environment" do
    def app
      Rack::Builder.new do
        use RackEnvironment, :environment => { :ONE => 'one_value' }
        run TestApplication.new
      end
    end

    it "should have the proper environment set" do
      @environment['ONE'].should == 'one_value'
    end
  end

end
