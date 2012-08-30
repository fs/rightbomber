class Map
  width: 30
  height: 20

  generate: (options = {}) =>
    @initCells()
    @generateTerrain()

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
  initCells: ->
    @cells = []
    for x in [0...@width]
      @cells[x] = column = new Array(@height)
      for y in [0...@height]
        column[y] = new MapCell()

  # add some more interesting objects to map
  generateTerrain: ->
    for x in [0...@width]
      for y in [0...@height]
        if (x % 4 == 3 || y % 4 == 3) && Math.random() < 0.5
          @getCell(x, y).passable = false
