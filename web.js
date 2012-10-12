var
  connect = require('connect'),
  compiler = require('connect-compiler'),
  http = require('http');

var app = connect()

  .use(compiler({
    enabled : [ 'coffee' ],
    log_level: 'debug',
    src     : 'app',
    dest    : 'public',
    options : {
      coffee : { bare : true }
    }
  }))

  .use(connect.favicon())
  .use(connect.logger('dev'))
  .use(connect.static('public'))

http.createServer(app).listen(process.env.PORT || 3000);

console.log('Server running at http://127.0.0.1:' + (process.env.PORT || 3000));
