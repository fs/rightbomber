// Generated by CoffeeScript 1.3.3
var MapView,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

MapView = (function(_super) {

  __extends(MapView, _super);

  MapView.prototype.baseElement = '<table>';

  function MapView(map) {
    this.map = map;
    this.update = __bind(this.update, this);

  }

  MapView.prototype.update = function() {
    var table, td, tr, x, y, _i, _j, _ref, _ref1, _results;
    table = this.getElement();
    table.attr({
      id: "map"
    });
    table.css({
      width: this.map.width * this.tileSize,
      height: this.map.height * this.tileSize
    });
    _results = [];
    for (y = _i = 0, _ref = this.map.height; 0 <= _ref ? _i < _ref : _i > _ref; y = 0 <= _ref ? ++_i : --_i) {
      tr = $("<tr>");
      for (x = _j = 0, _ref1 = this.map.width; 0 <= _ref1 ? _j < _ref1 : _j > _ref1; x = 0 <= _ref1 ? ++_j : --_j) {
        td = $("<td>", {
          "class": this.map.getCell(x, y).getType()
        });
        tr.append(td);
      }
      _results.push(table.append(tr));
    }
    return _results;
  };

  return MapView;

})(BaseView);
