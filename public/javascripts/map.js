// Generated by CoffeeScript 1.3.3
var Map,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Map = (function() {

  function Map() {
    this.getCell = __bind(this.getCell, this);

    this.getRect = __bind(this.getRect, this);

    this.generate = __bind(this.generate, this);

  }

  Map.prototype.rows = 20;

  Map.prototype.cols = 40;

  Map.prototype.generate = function(options) {
    if (options == null) {
      options = {};
    }
    this.initCells();
    return this.generateTerrain();
  };

  Map.prototype.getRect = function() {
    return new Rect({
      left: 0,
      top: 0,
      width: this.cols,
      height: this.rows
    });
  };

  Map.prototype.getCell = function(x, y) {
    return this.cells[Math.floor(y)][Math.floor(x)];
  };

  Map.prototype.initCells = function() {
    var colnum, rownum, _results;
    this.cells = [];
    rownum = 0;
    _results = [];
    while (rownum < this.rows) {
      colnum = 0;
      this.cells[rownum] = new Array(this.cols);
      while (colnum < this.cols) {
        this.cells[rownum][colnum] = new MapCell();
        colnum++;
      }
      _results.push(rownum++);
    }
    return _results;
  };

  Map.prototype.generateTerrain = function() {
    var colnum, rownum, _results;
    rownum = 0;
    _results = [];
    while (rownum < this.rows) {
      colnum = 0;
      while (colnum < this.cols) {
        if ((rownum % 4 === 3 || colnum % 4 === 3) && Math.random() < 0.5) {
          this.cells[rownum][colnum].passable = false;
        }
        colnum++;
      }
      _results.push(rownum++);
    }
    return _results;
  };

  return Map;

})();
