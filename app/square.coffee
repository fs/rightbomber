class Square # model
  map: null
  direction: 0
  velocity: 0
  size: 1

  epsilon: 0.05

  constructor: (@map) ->
    @position =
      x: 0
      y: 0

  move: (timeDelta) =>
    dx = 0
    dy = 0
    velocity = @velocity * timeDelta

    dx =  velocity if @direction == 0
    dx = -velocity if @direction == 2
    dy =  velocity if @direction == 1
    dy = -velocity if @direction == 3

    newPosition =
      x: @position.x + dx
      y: @position.y + dy

    moved = @isPassable(newPosition)

    @position = newPosition if moved

    return moved


  isPassable: (position) ->
    x1 = Math.floor(position.x + @epsilon)
    y1 = Math.floor(position.y + @epsilon)

    x2 = Math.floor(position.x + @size - @epsilon)
    y2 = Math.floor(position.y + @size - @epsilon)

    (x1 >= 0) && (y1 >= 0) &&
    (x2 < @map.cols) && (y2 < @map.rows) &&
    @map.getCell(x1, y1).passable &&
    @map.getCell(x1, y2).passable &&
    @map.getCell(x2, y1).passable &&
    @map.getCell(x2, y2).passable

