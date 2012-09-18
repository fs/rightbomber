class Map extends Rect
  width: 10
  height: 10

  constructor: (@width, @height) ->
    @setWidth(@width)
    @setHeight(@height)
    @objects = []

  generate: (options = {}) ->
    @initCells()
    @generateTerrain()

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
        if (x % 4 == 3 || y % 4 == 3) && Math.random() < 0.25
          @cells[x][y].passable = false
