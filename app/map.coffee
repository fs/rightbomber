class Map
  width: 30
  height: 20

  constructor: ->
    @objects = []

  generate: (options = {}) =>
    @initCells()
    #@generateRoughTerrainMap()
    #@generateCrissCrossMap()
    @generateMazeMap()

  getRect: =>
    new Rect
      left: 0
      top: 0
      width: @width
      height: @height

  constrain: (coordinate, max) =>
    Math.max(0, Math.min(max, Math.floor(coordinate)))

  getCell: (x, y) =>
    @cells[@constrain(x, @width - 1)][@constrain(y, @height - 1)]

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
    line_width = 1
    @eachCell(@makeImpassable)

    corners = @getCorners()
    @forEachCellInLine(corners[0], corners[2], line_width, @makePassable)
    @forEachCellInLine(corners[1], corners[3], line_width, @makePassable)

  generateMazeMap: () =>
    @eachCell(@makeImpassable)
    nodes = @getMazeNodes()
    @connectMazeNodes(nodes, @makePassable)


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
  forEachCellInLine: (from, to, width, cb_func) =>
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

  # this separate all field for cells & walls.
  getMazeNodes: () =>
    rows_num = []
    cols_num = []
    # if we have even num of columns or rows
    # central wall should be thicker  then
    vertical_shift = 1 - (@width % 2)
    horizontal_shift = 1 - (@height % 2)

    i = 0
    while i < @width / 2
      if i >= @width / 4
        cols_num.push(i * 2 + vertical_shift)
      else
        cols_num.push(i * 2)
      i++

    j = 0
    while j < @height / 2
      if j >= @height / 4
        rows_num.push(j * 2 + horizontal_shift)
      else
        rows_num.push(j * 2)
      j++

    maze_nodes = []
    for i of cols_num
      maze_nodes[i] = []
      for j of rows_num
        cell = @getCell(cols_num[i], rows_num[j])
        maze_nodes[i][j] = cell
        #@makePassable(cell)

    maze_nodes

  connectMazeNodes: (maze_nodes, cb_func) =>
    path = [[0, 0]]
    cells = []
    while path.length > 0
      point = path[path.length - 1]
      cell  = maze_nodes[point[0]][point[1]]
      cell.visited = true
      cells.push(cell)

      neighbours = @getUnvisitedNeighbourNodes(maze_nodes, point[0], point[1])
      if neighbours.length > 0
        new_point = neighbours[Math.floor(Math.random() * neighbours.length)]
        path.push(new_point)

        new_cell = maze_nodes[new_point[0]][new_point[1]]
        cells = cells.concat(@getCellsBetween(cell, new_cell))
      else
        path.pop()

    for i of cells
      cb_func.call(@, cells[i])

  # vertical or horizontal
  getCellsBetween: (from, to) =>
    result = []
    if from.x == to.x
      for y in [from.y...to.y]
        result.push(@getCell(from.x, y))
    else if from.y == to.y
      for x in [from.x...to.x]
        result.push(@getCell(x, from.y))
    else
      # non-straight line)

    # first element shouldn't be in result, bcz it == from
    result.slice(1)

  getUnvisitedNeighbourNodes: (maze_nodes, x, y) =>
    max_x = (@width / 2) - 1
    max_y = (@height / 2) - 1

    neighbours = []
    neighbours.push([x - 1, y]) if x > 0      && !maze_nodes[x - 1][y].visited
    neighbours.push([x + 1, y]) if x < max_x  && !maze_nodes[x + 1][y].visited
    neighbours.push([x, y - 1]) if y > 0      && !maze_nodes[x][y - 1].visited
    neighbours.push([x, y + 1]) if y < max_y  && !maze_nodes[x][y + 1].visited

    neighbours
