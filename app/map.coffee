class Map extends Rect
  constructor: (@width = 30, @height = 20) ->
    @setWidth(@width)
    @setHeight(@height)
    @objects = []

  generate: (options = {}) ->
    @initCells()
    @generateTerrain()

  push: (object) ->
    @objects.push object

  initCells: ->
    @cells = []
    for x in [0...@width]
      @cells[x] = column = new Array(@height)
      for y in [0...@height]
        cell = new Cell(x, y)
        column[y] = cell
        @objects.push cell

  generateTerrain: ->
    for x in [0...@width]
      for y in [0...@height]
        if (x % 4 == 3 || y % 4 == 3) && Math.random() < 0.5
          @cells[x][y].passable = false
