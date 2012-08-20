window.map_debug = (message) ->
  console.log("map: #{message}")

class MapModel
  constructor: ->
    map_debug("init")

  generate: (options) =>
    map_debug("generate")
    @cells = []
    options ||= {}
    rows = options.rows || 20
    cols = options.cols || 20

    @cells = @initCells(rows, cols)
    @generateTerrain()

  # public interface
  getCell: (x, y) ->
    map_debug("get cells")
    try
      @cells[x][y]
    catch e
      new MapCell()

  # private functions
  # init cells array
  initCells: (rows, cols) =>
    map_debug("init cells")
    @rows = rows
    @cols = cols

    cells = []
    rownum = 0
    while rownum < rows
      colnum = 0
      cells[rownum] = new Array(cols)
      while colnum < cols
        cells[rownum][colnum] = new MapCell()
        colnum++
      rownum++
    cells

  # add some more interesting objects to map
  generateTerrain: () =>
    map_debug("generateTerrain")
    rownum = 0
    while rownum < @rows
      colnum = 0
      while colnum < @cols
        if rownum + colnum % 8 == 0
          @cells[rownum][colnum].setPassable(false)
        colnum++
      rownum++
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
