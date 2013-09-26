require 'rack'

class HelloWorld
  def call env
    req      = Rack::Request.new(env)
    response = Rack::Response.new("Hello world! cookies = #{req.cookies.inspect}\n")
    response.write("asignatura => #{req.cookies['asignatura']}") if req.cookies['asignatura']
    response.status = 200
    response['Content-type'] = "text/plain"
    response.set_cookie('asignatura', 'SYTW')
    response.finish
  end
end

Rack::Handler::WEBrick::run HelloWorld.new
