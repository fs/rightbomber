class Map
  width: 30
  height: 20

  constructor: ->
    @objects = []

  generate: (options = {}) =>
    @initCells()
    #@generateRoughTerrainMap()
    @generateCrissCrossMap()

  getRect: =>
    new Rect
      left: 0
      top: 0
      width: @width
      height: @height

  getCell: (x, y) =>
    @cells[Math.floor(x)][Math.floor(y)]

  # private functions
  # init cells array
  initCells: =>
    @cells = []
    for x in [0...@width]
      @cells[x] = column = new Array(@height)
      for y in [0...@height]
        column[y] = new Cell(x, y)

  # add some more interesting objects to map
  generateRoughTerrainMap: =>
    for x in [0...@width]
      for y in [0...@height]
        if (x % 4 == 3 || y % 4 == 3) && Math.random() < 0.5
          @getCell(x, y).passable = false

  generateCrissCrossMap: () =>
    @eachCell(@makeImpassable)

    corners = @getCorners()
    line_width = 1
    @forEachCellOnLine(corners[0], corners[2], line_width, @makePassable)
    @forEachCellOnLine(corners[1], corners[3], line_width, @makePassable)

  # helpers
  eachCell: (cb_func) =>
    for x in [0...@width]
      for y in [0...@height]
        cb_func.call(@, @getCell(x, y))

  getCorners: =>
    [
      @getCell(0, 0),
      @getCell(0, @height - 1),
      @getCell(@width - 1, @height - 1),
      @getCell(@width - 1, 0)
    ]

  makeImpassable: (cell) =>
    cell.passable = false

  makePassable: (cell) =>
    cell.passable = true

   # found all cell on line from - to.
   # and call cb_func for each
   # NOTE: not clean, can call multiple time on same cell
   # NOTE: is not correctly working on border cells
  forEachCellOnLine: (from, to, width, cb_func) =>
    results = []
    dx = to.x - from.x
    dy = to.y - from.y

    neigbours_by_x = Math.abs(dx) < Math.abs(dy)

    steps_num = Math.abs(dx) + Math.abs(dy)
    i = 0
    while i <= steps_num
      cursor =
        x: from.x + dx * i / steps_num
        y: from.y + dy * i / steps_num

      if neigbours_by_x
        # dx = 0, for example
        for new_x in [(cursor.x - width)..(cursor.x + width)]
          if new_x >= 0 && new_x < @width
            results.push @getCell(new_x, cursor.y)
      else
        for new_y in [(cursor.y - width)..(cursor.y + width)]
          if new_y >= 0 && new_y < @height
            results.push @getCell(cursor.x, new_y)

      # get close neighbours ( at horizontal line or vertical )
      i++

    for i of results
      cb_func.call(@, results[i])

    true
