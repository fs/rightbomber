class MapModel
  constructor: (options) ->
    rows = options.rows || 20
    cols = options.cols || 20

    @initCells(rows, cols)
    @generateTerrain()

  # public interface
  getCell: (x, y) ->
    try
      @cells[x][y]
    catch e
      new MapCell()

  # private functions
  # init cells array
  initCells: (rows, cols) =>
    @rows = rows
    @cols = cols

    @cells = []
    rownum = 0
    while rownum < rows
      colnum = 0
      while colnum < cols
        @cells[rownum][colnum] = new MapCell()
    @cells

  # add some more interesting objects to map
  generateTerrain: () =>
    @cells = []
    rownum = 0
    while rownum < @rows
      colnum = 0
      while colnum < @cols
        if rownum + colnum % 10 == 0
          @cells[rownum][colnum].setPassable(false)
    @cells

    #  forEachCell: (callback, context) =>

class MapView
  constructor: (map) ->
    @map = map

class MapCell
  constructor: (rownum, colnum) ->
    @rownum = rownum
    @colnum = colnum
    @passable = true
  
  isPassable: =>
    @passable

  setPassable: (value) =>
    @passable = value
