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

  getCell: (x, y) ->
    cell = @cells[@constrain(x, @width - 1)][@constrain(y, @height - 1)]
    cell.objects = @objects
    cell

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
