var
  connect = require('connect'),
  http = require('http');

var app = connect()
  .use(connect.favicon())
  .use(connect.logger('dev'))
  .use(connect.static('public'))
  .use(connect.directory('public'))
  // .use(connect.cookieParser())
  // .use(connect.session({ secret: 'my secret here' }))
  .use(function(req, res){
    res.writeHead(404, {'Content-Type': 'text/plain'});
    res.end('nothing here\n');
  });


http.createServer(app).listen(3000);

console.log('Server running at http://127.0.0.1:3000/');
