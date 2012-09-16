// Generated by CoffeeScript 1.3.3
var Bomb,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Bomb = (function(_super) {

  __extends(Bomb, _super);

  Bomb.prototype.size = 0.6;

  Bomb.prototype.TTL = 3.0;

  function Bomb(player) {
    this.player = player;
    this.olderBy = __bind(this.olderBy, this);

    this.exploded = false;
    this.timer = this.TTL;
    Bomb.__super__.constructor.call(this, this.player.map);
    this.moveBy(this.player.left, this.player.top);
    this.representation = new ObjectView(this);
    this.update();
  }

  Bomb.prototype.olderBy = function(timeDelta) {
    if (!this.exploded && this.timer < 0) {
      this.explode();
      return this.update();
    } else {
      return this.timer -= timeDelta;
    }
  };

  Bomb.prototype.explode = function() {
    var i, piece, _i, _results;
    this.exploded = true;
    _results = [];
    for (i = _i = 0; _i <= 50; i = ++_i) {
      _results.push(piece = new BombPiece(this));
    }
    return _results;
  };

  Bomb.prototype.update = function() {
    this.representation.state = ['bomb'];
    if (this.exploded) {
      this.representation.state.push('exploded');
    }
    return this.representation.update();
  };

  Bomb.prototype.intersectsWith = function(object) {
    return this.player !== object && Bomb.__super__.intersectsWith.call(this, object);
  };

  return Bomb;

})(SquaredObject);
