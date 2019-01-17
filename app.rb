require 'webrick'
require 'pty'

server = WEBrick::HTTPServer.new Port: (ENV['PORT'] || 8000), BindAdress: '0.0.0.0'

server.mount_proc '/' do |req, res|
  stdout, _ = PTY.spawn 'uptime'
  res.body = stdout
end

server.start
