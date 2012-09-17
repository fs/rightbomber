// Generated by CoffeeScript 1.3.3
var ObjectView,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

ObjectView = (function(_super) {

  __extends(ObjectView, _super);

  ObjectView.prototype.state = null;

  ObjectView.prototype.square = null;

  function ObjectView(square) {
    this.square = square;
  }

  ObjectView.prototype.update = function() {
    var element, size, style, x, y;
    element = this.getElement();
    x = Math.round(this.tileSize * this.square.left);
    y = Math.round(this.tileSize * this.square.top);
    size = Math.round(this.tileSize * this.square.size);
    element.className = this.state.join(' ');
    style = element.style;
    if (this.opacity != null) {
      style.opacity = this.opacity;
    }
    style.left = x + 'px';
    style.top = y + 'px';
    style.width = size + 'px';
    return style.height = size + 'px';
  };

  return ObjectView;

})(BaseView);
