class Map
  width: 30
  height: 20

  constructor: ->
    @objects = []

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
    @cells[@constrain(x, @width - 1)][@constrain(y, @height - 1)]

  # private
  constrain: (coordinate, max) ->
    Math.max(0, Math.min(max, Math.floor(coordinate)))

  initCells: ->
    @cells = []
    for x in [0...@width]
      @cells[x] = column = new Array(@height)
      for y in [0...@height]
        column[y] = new Cell(x, y)

  # add some more interesting objects to map
  generateTerrain: ->
    for x in [0...@width]
      for y in [0...@height]
        if (x % 4 == 3 || y % 4 == 3) && Math.random() < 0.5
          @getCell(x, y).passable = false
