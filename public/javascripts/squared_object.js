// Generated by CoffeeScript 1.3.3
var SquaredObject,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

SquaredObject = (function(_super) {

  __extends(SquaredObject, _super);

  SquaredObject.prototype.map = null;

  SquaredObject.prototype.size = 1;

  SquaredObject.prototype.moved = false;

  SquaredObject.prototype.velocity = 0;

  SquaredObject.prototype.direction = 0;

  SquaredObject.prototype.epsilon = 0.001;

  function SquaredObject(map) {
    this.map = map;
    this.map.objects.push(this);
    this.setSize(this.size);
  }

  SquaredObject.prototype.setSize = function(newSize) {
    this.size = newSize;
    return SquaredObject.__super__.setSize.call(this, newSize);
  };

  SquaredObject.prototype.olderBy = function(timeDelta) {
    var distance, distanceToGo;
    distanceToGo = distance = this.velocity * timeDelta;
    if (distanceToGo > 0) {
      distanceToGo = this.sprint(distanceToGo);
    }
    if (distanceToGo > 0) {
      distanceToGo = this.comeCloser(distanceToGo);
    }
    if (distanceToGo > 0) {
      distanceToGo = this.cutCorners(distanceToGo);
    }
    return distanceToGo < distance;
  };

  SquaredObject.prototype.sprint = function(distance) {
    var step;
    step = this.size;
    while (distance > step) {
      if (this.move(step, this.direction)) {
        distance -= step;
      } else {
        break;
      }
    }
    return distance;
  };

  SquaredObject.prototype.comeCloser = function(distance) {
    var step;
    distance = Math.min(this.size, distance);
    step = distance;
    while (Math.min(step, distance) > this.epsilon) {
      if (this.move(step, this.direction)) {
        distance -= step;
      } else {
        step /= 2;
      }
    }
    return distance;
  };

  SquaredObject.prototype.cutCorners = function(distance) {
    var direction, dx, dy, impactArea, left, leftArea, right, rightArea;
    dx = this.dx(distance, this.direction);
    dy = this.dy(distance, this.direction);
    this.moveBy(dx, dy);
    impactArea = this.blockedArea();
    left = this.rotateLeft(this.direction);
    leftArea = this.blockedAreaAt(distance, left);
    right = this.rotateRight(this.direction);
    rightArea = this.blockedAreaAt(distance, right);
    this.moveBy(-dx, -dy);
    if (impactArea / distance < this.size) {
      direction = leftArea > rightArea ? right : left;
      if (this.move(distance, direction)) {
        return 0;
      }
    }
    return distance;
  };

  SquaredObject.prototype.move = function(distance, direction) {
    var dx, dy, movable;
    dx = this.dx(distance, direction);
    dy = this.dy(distance, direction);
    this.moveBy(dx, dy);
    if (!(movable = this.isMovable())) {
      this.moveBy(-dx, -dy);
    }
    return movable;
  };

  SquaredObject.prototype.blockedAreaAt = function(distance, direction) {
    var area, dx, dy;
    dx = this.dx(distance, direction);
    dy = this.dy(distance, direction);
    this.moveBy(dx, dy);
    area = this.blockedArea();
    this.moveBy(-dx, -dy);
    return area;
  };

  SquaredObject.prototype.dx = function(distance, direction) {
    return distance * Math.cos(direction * Math.PI / 2);
  };

  SquaredObject.prototype.dy = function(distance, direction) {
    return distance * Math.sin(direction * Math.PI / 2);
  };

  SquaredObject.prototype.rotateLeft = function(direction) {
    return (direction + 3) % 4;
  };

  SquaredObject.prototype.rotateRight = function(direction) {
    return (direction + 1) % 4;
  };

  SquaredObject.prototype.intersectsWith = function(object) {
    return this !== object && SquaredObject.__super__.intersectsWith.call(this, object);
  };

  SquaredObject.prototype.cells = function() {
    return [this.map.getCell(this.left, this.top), this.map.getCell(this.left, this.bottom), this.map.getCell(this.right, this.top), this.map.getCell(this.right, this.bottom)];
  };

  SquaredObject.prototype.isMovable = function() {
    var cell, object, _i, _j, _len, _len1, _ref, _ref1;
    if (!this.map.contains(this)) {
      return false;
    }
    _ref = this.cells();
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      cell = _ref[_i];
      if (!cell.passable) {
        return false;
      }
      _ref1 = cell.objects;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        object = _ref1[_j];
        if (this.intersectsWith(object)) {
          return false;
        }
      }
    }
    return true;
  };

  SquaredObject.prototype.blockedArea = function() {
    var area, cell, object, _i, _j, _len, _len1, _ref, _ref1;
    if (!this.map.contains(this)) {
      return this.size * this.size;
    }
    area = 0;
    _ref = this.cells();
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      cell = _ref[_i];
      if (!cell.passable) {
        area += this.intersectionArea(cell);
      }
      _ref1 = cell.objects;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        object = _ref1[_j];
        area += this.intersectionArea(object);
      }
    }
    return area;
  };

  return SquaredObject;

})(Rect);
