require 'rack'
require 'thin'

app = lambda do |env|
  req = Rack::Request.new env
  res = Rack::Response.new

  if req.path_info == '/redirect'
    res.redirect('https://plus.google.com/u/0/')
  else
    res.write "You did not get redirected"
  end
  res.finish
end

Rack::Server.start(
 :app => app,
 :Port => 9292,
 :server => 'thin'
)
