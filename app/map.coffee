class Map
  rows: 20
  cols: 40

  constructor: ->
    console.log "map: init"

  generate: (options = {}) =>
    console.log "map: generate"
    @initCells()
    # @generateTerrain()

  getCell: (x, y) =>
    @cells[y][x]

  # private functions
  # init cells array
  initCells: ->
    console.log "map: init cells"

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
    console.log "map: generateTerrain"
    rownum = 0
    while rownum < @rows
      colnum = 0
      while colnum < @cols
        if (rownum + colnum) % 8 == 4 && Math.random() < 0.75
          @cells[rownum][colnum].passable = false
        colnum++
      rownum++
