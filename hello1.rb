require 'rack'

class HelloWorld
  def call env
    [200, {"Content-Type" => "text/plain"}, ["Hello world"]]
  end
end

Rack::Handler::WEBrick::run HelloWorld.new
