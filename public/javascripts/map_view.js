// Generated by CoffeeScript 1.3.3
var MapView;

MapView = (function() {

  function MapView(map) {
    this.map = map;
    console.log("map: view init");
  }

  MapView.prototype.render = function() {
    var cell, colnum, rownum, table, td, tr;
    rownum = 0;
    table = $("<table/>", {
      id: "map"
    });
    table.css({
      width: this.map.cols * 16,
      height: this.map.rows * 16
    });
    while (rownum < this.map.rows) {
      colnum = 0;
      tr = $("<tr>", {
        "data-row": rownum
      });
      while (colnum < this.map.cols) {
        cell = this.map.getCell(colnum, rownum);
        td = $("<td>", {
          "data-row": rownum,
          "data-col": colnum,
          "class": cell.getType()
        });
        tr.append(td);
        colnum++;
      }
      rownum++;
      table.append(tr);
    }
    return table;
  };

  return MapView;

})();
