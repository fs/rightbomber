// Generated by CoffeeScript 1.3.3
var Dummy,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Dummy = (function(_super) {

  __extends(Dummy, _super);

  function Dummy(map) {
    this.map = map;
    Dummy.__super__.constructor.call(this, this.map);
    this.view = new ObjectView(this);
    this.update();
  }

  Dummy.prototype.randomPlacement = function() {
    var x, y, _results;
    _results = [];
    while (true) {
      x = this.map.getWidth() * Math.random();
      y = this.map.getHeight() * Math.random();
      this.moveBy(x, y);
      if (this.isMovable()) {
        break;
      }
      _results.push(this.moveBy(-x, -y));
    }
    return _results;
  };

  Dummy.prototype.update = function() {
    this.view.state = ['dummy'];
    return this.view.update();
  };

  return Dummy;

})(SquaredObject);