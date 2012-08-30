// Generated by CoffeeScript 1.3.3
var Keyboard,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Keyboard = (function() {

  Keyboard.prototype.keyMap = {
    38: 'up',
    40: 'down',
    37: 'left',
    39: 'right',
    191: 'slash',
    87: 'w',
    83: 's',
    65: 'a',
    68: 'd'
  };

  Keyboard.prototype.keys = {};

  function Keyboard() {
    this.activate = __bind(this.activate, this);

  }

  Keyboard.prototype.activate = function() {
    var _this = this;
    $(document).keydown(function(e) {
      return _this.keys[_this.keyMap[e.keyCode]] = true;
    });
    return $(document).keyup(function(e) {
      return _this.keys[_this.keyMap[e.keyCode]] = false;
    });
  };

  return Keyboard;

})();
