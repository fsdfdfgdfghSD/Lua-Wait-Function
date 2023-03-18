local socket = {}

function socket.tcp()
  error("socket.tcp() not implemented")
end

function socket.connect()
  error("socket.connect() not implemented")
end

function socket.bind()
  error("socket.bind() not implemented")
end

function socket.listen()
  error("socket.listen() not implemented")
end

function socket.select()
  error("socket.select() not implemented")
end

function socket.gettime()
  return os.clock()
end

return socket
