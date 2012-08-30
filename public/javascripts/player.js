// Generated by CoffeeScript 1.3.3
var Player,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Player = (function() {

  Player.prototype.map = null;

  Player.prototype.square = null;

  Player.prototype.moving = false;

  Player.prototype.velocity = 4;

  Player.prototype.direction = 'up';

  Player.prototype.directionMap = {
    'right': 0,
    'up': 3,
    'left': 2,
    'down': 1
  };

  function Player(map) {
    this.map = map;
    this.getState = __bind(this.getState, this);

    this.move = __bind(this.move, this);

    this.square = new Square(this.map);
    this.square.size = 0.5;
    this.representation = new Representation(this.square);
  }

  Player.prototype.move = function(timeDelta) {
    if (this.moving) {
      this.square.velocity = this.velocity;
      this.square.direction = this.directionMap[this.direction];
      if (this.square.move(timeDelta)) {
        this.representation.state = this.getState();
        return this.representation.update();
      }
    }
  };

  Player.prototype.getState = function() {
    var state;
    state = ['player'];
    if (this.moving) {
      state.push('moving');
    }
    state.push(this.direction);
    return state;
  };

  return Player;

})();