require 'rack'
require 'pry-debugger'

class HelloWorld
  def call env
    binding.pry
    [200, {"Content-Type" => "text/plain"}, ["Hello world"]]
  end
end
