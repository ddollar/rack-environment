class TestApplication

  def call(env)
    return 200, { 'X-Rack-Environment' => ENV }, ['']
  end

end
