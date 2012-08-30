class Map
  rows: 20
  cols: 40

  generate: (options = {}) =>
    @initCells()
    @generateTerrain()

  getRect: =>
    new Rect
      left: 0
      top: 0
      width: @cols
      height: @rows

  getCell: (x, y) =>
    @cells[Math.floor(y)][Math.floor(x)]

  # private functions
  # init cells array
  initCells: ->

    @cells = []
    rownum = 0
    while rownum < @rows
      colnum = 0
      @cells[rownum] = new Array(@cols)
      while colnum < @cols
        @cells[rownum][colnum] = new MapCell()
        colnum++
      rownum++

  # add some more interesting objects to map
  generateTerrain: ->
    rownum = 0
    while rownum < @rows
      colnum = 0
      while colnum < @cols
        if (rownum % 4 == 3 || colnum % 4 == 3) && Math.random() < 0.5
          @cells[rownum][colnum].passable = false
        colnum++
      rownum++
