import SimpleHTTPServer
import SocketServer

PORT = 8080

class Handler(SimpleHTTPServer.SimpleHTTPRequestHandler):
    pass

Handler.extensions_map['.wasm'] = 'application/wasm'

httpd = SocketServer.TCPServer(("", PORT), Handler)

print "Serving HTTP on port", PORT
httpd.serve_forever()
