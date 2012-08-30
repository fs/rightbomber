// Generated by CoffeeScript 1.3.3
var Square,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Square = (function() {

  Square.prototype.map = null;

  Square.prototype.size = 1;

  Square.prototype.velocity = 0;

  Square.prototype.position = null;

  Square.prototype.direction = 0;

  Square.prototype.epsilon = 0.05;

  function Square(map) {
    this.map = map;
    this.getRect = __bind(this.getRect, this);

    this.intersectsWith = __bind(this.intersectsWith, this);

    this.move = __bind(this.move, this);

    this.position = {
      x: 0,
      y: 0
    };
  }

  Square.prototype.move = function(timeDelta) {
    var dx, dy, movable, oldPosition, velocity;
    dx = 0;
    dy = 0;
    velocity = this.velocity * timeDelta;
    if (this.direction === 0) {
      dx = velocity;
    }
    if (this.direction === 2) {
      dx = -velocity;
    }
    if (this.direction === 1) {
      dy = velocity;
    }
    if (this.direction === 3) {
      dy = -velocity;
    }
    oldPosition = this.position;
    this.position = {
      x: oldPosition.x + dx,
      y: oldPosition.y + dy
    };
    movable = this.isMovable();
    if (!movable) {
      this.position = oldPosition;
    }
    return movable;
  };

  Square.prototype.intersectsWith = function(square) {
    return getRect().intersectsWith(square.getRect());
  };

  Square.prototype.getRect = function() {
    return new Rect({
      left: this.position.x,
      top: this.position.y,
      size: this.size
    });
  };

  Square.prototype.isMovable = function() {
    var cell, cells, rect, _i, _len;
    rect = this.getRect();
    if (!this.map.getRect().contains(rect)) {
      return false;
    }
    cells = [this.map.getCell(rect.left, rect.top), this.map.getCell(rect.left, rect.bottom), this.map.getCell(rect.right, rect.top), this.map.getCell(rect.right, rect.bottom)];
    for (_i = 0, _len = cells.length; _i < _len; _i++) {
      cell = cells[_i];
      if (!cell.passable) {
        return false;
      }
    }
    return true;
  };

  return Square;

})();
