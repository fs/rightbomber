window.map_debug = (message) ->
  console.log("map: #{message}")

$ ->
  map = new MapModel()
  map.generate({})

  map_view = new MapView()
  grid = map_view.render(map, {})

  $("body").append(grid)

class MapModel
  constructor: ->
    map_debug("init")

  generate: (options) =>
    map_debug("generate")
    @cells = []
    options ||= {}
    rows = options.rows || 40
    cols = options.cols || 100

    @cells = @initCells(rows, cols)
    @generateTerrain()

  # public interface
  getCell: (x, y) ->
    @cells[x][y]
#    map_debug("get cells")
#    try
#      @cells[x][y]
#    catch e
#      new MapCell()

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
        if (rownum + colnum) % 8 == 0
          @cells[rownum][colnum].setPassable(false)
        colnum++
      rownum++
    @cells

    #  forEachCell: (callback, context) =>

class MapView
  constructor: () ->
    map_debug("view init")

  render: (map) ->
    $result = $("<table/>", { id: "map-grid", style: "display: block;" })
    rownum = 0
    while rownum < map.rows
      colnum = 0
      $row = $("<tr />", { "data-row": rownum })
      while colnum < map.cols
        cell = map.getCell(rownum, colnum)
        $cell = $("<td />", { "data-row": rownum, "data-col": colnum, class: cell.getType()})
        $row.append($cell)
        colnum++
      rownum++
      $result.append($row)
    $result

class MapCell
  constructor: (rownum, colnum) ->
    @rownum = rownum
    @colnum = colnum
    @passable = true

  getType: =>
    if @passable
      'grass'
    else
      'stone'
  
  isPassable: =>
    @passable

  setPassable: (value) =>
    @passable = value
