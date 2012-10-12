var
  connect = require('connect'),
  compiler = require('connect-compiler'),
  sass = require('node-sass'),
  http = require('http');

var app = connect()
  .use(connect.logger('dev'))
  .use(compiler({
    enabled : [ 'coffee' ],
    log_level: 'debug',
    src     : 'app',
    dest    : 'public',
    options : {
      coffee : { bare : true }
    }
  }))
  .use(sass.middleware({
      src: __dirname + '/app',
      dest: __dirname + '/public',
      debug: true
    })
  )
  .use(connect.static('public'));

http.createServer(app).listen(process.env.PORT || 3000);

console.log('Server running at http://127.0.0.1:' + (process.env.PORT || 3000));
