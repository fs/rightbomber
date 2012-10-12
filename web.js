var
  connect = require('connect'),
  compiler = require('connect-compiler'),
  sass = require('node-sass'),
  http = require('http');

var port = process.env.PORT || 3000;

var app = connect()
  .use(compiler({
    enabled   : [ 'coffee' ],
    log_level : 'debug',
    src       : 'app',
    dest      : 'public',
    options   : { coffee : { bare : true } }
  }))
  .use(connect.favicon())
  .use(connect.logger('dev'))
  .use(sass.middleware({
    src   : 'app',
    dest  : 'public',
    debug : true
  }))
  .use(connect.static('public'));

http.createServer(app).listen(port);

console.log('Server running at http://0.0.0.0:' + port);
