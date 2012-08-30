// Generated by CoffeeScript 1.3.3
var Bomb,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Bomb = (function() {

  Bomb.prototype.map = null;

  Bomb.prototype.square = null;

  function Bomb(player) {
    this.player = player;
    this.move = __bind(this.move, this);

    this.map = this.player.map;
    this.square = new Square(this.map);
    this.square.size = 0.6;
    this.square.position.x = this.player.square.position.x;
    this.square.position.y = this.player.square.position.y;
    this.representation = new Representation(this.square);
    this.update();
  }

  Bomb.prototype.move = function(timeDelta) {};

  Bomb.prototype.update = function() {
    this.representation.state = ['bomb'];
    return this.representation.update();
  };

  return Bomb;

})();
