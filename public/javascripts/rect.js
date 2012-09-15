// Generated by CoffeeScript 1.3.3
var Rect;

Rect = (function() {

  function Rect() {}

  Rect.prototype.left = 0;

  Rect.prototype.top = 0;

  Rect.prototype.right = 1;

  Rect.prototype.bottom = 1;

  Rect.prototype.moveBy = function(dx, dy) {
    this.left += dx;
    this.right += dx;
    this.top += dy;
    return this.bottom += dy;
  };

  Rect.prototype.getWidth = function() {
    return this.right - this.left;
  };

  Rect.prototype.getHeight = function() {
    return this.bottom - this.top;
  };

  Rect.prototype.setWidth = function(newWidth) {
    return this.right = this.left + newWidth;
  };

  Rect.prototype.setHeight = function(newHeight) {
    return this.bottom = this.top + newHeight;
  };

  Rect.prototype.setSize = function(newSize) {
    this.setWidth(newSize);
    return this.setHeight(newSize);
  };

  Rect.prototype.intersectsWith = function(rect) {
    var clear;
    clear = (this.left > rect.right) || (this.right < rect.left) || (this.top > rect.bottom) || (this.bottom < rect.top);
    return !clear;
  };

  Rect.prototype.contains = function(rect) {
    return (this.left <= rect.left) && (this.right >= rect.right) && (this.top <= rect.top) && (this.bottom >= rect.bottom);
  };

  return Rect;

})();
