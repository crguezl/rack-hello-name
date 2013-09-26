require 'rack'
require 'thin'

app = lambda do |env|
  req = Rack::Request.new env
  res = Rack::Response.new

  body = "--------------- Header ------------------\n"

  if req.path_info == '/hello'
    body << "hi "
    name = req['name']
    body << name if name 
    body << "\n"
  else
    body << "Instead of #{req.url} visit something like "+
            "http://localhost:8080/hello?name=Casiano\n"
  end
  res.headers['Content-Type'] = 'text/plain'
  res.body = [ body ]
  res.finish
end

Rack::Handler::Thin.run app
