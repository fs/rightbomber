// Generated by CoffeeScript 1.3.3
var Rightbomber,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Rightbomber = (function() {

  function Rightbomber() {
    this.tick = __bind(this.tick, this);

    this.run = __bind(this.run, this);
    console.log('init');
  }

  Rightbomber.prototype.run = function() {
    var gameLoop, map, mapView, table;
    console.log('run');
    map = new Map;
    map.generate();
    mapView = new MapView(map);
    table = mapView.render();
    $(document.body).append(table);
    this.keyboard = new Keyboard;
    this.keyboard.activate();
    this.player = new Player;
    this.playerRepresentation = new Representation(document.body, this.player);
    gameLoop = new GameLoop(this.tick);
    return gameLoop.run();
  };

  Rightbomber.prototype.tick = function(timeDelta) {
    var direction, _i, _len, _ref;
    this.player.moving = false;
    _ref = ['right', 'up', 'left', 'down'];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      direction = _ref[_i];
      if (this.keyboard.keys[direction]) {
        this.player.moving = true;
        this.player.setDirection(direction);
      }
    }
    this.player.move(timeDelta);
    return this.playerRepresentation.update();
  };

  return Rightbomber;

})();
