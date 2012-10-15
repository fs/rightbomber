var
  connect = require('connect'),
  compiler = require('connect-compiler'),
  http = require('http');

var port = process.env.PORT || 3000;

var app = connect()
var app = connect()
  .use(connect.logger('dev'))
  .use(compiler({
    enabled   : [ 'coffee', 'stylus' ],
    log_level : 'warn',
    src       : 'app',
    dest      : 'public',
    options   : { coffee : { bare : true } }
  }))
  .use(connect.static('public'));

http.createServer(app).listen(port);

console.log('Server running at http://0.0.0.0:' + port);
