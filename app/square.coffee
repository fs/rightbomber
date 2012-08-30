class Square # model
  map: null
  size: 1
  velocity: 0
  position: null
  direction: 0

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

    oldPosition = @position

    @position =
      x: oldPosition.x + dx
      y: oldPosition.y + dy

    movable = @isMovable()

    @position = oldPosition unless movable

    return movable

  intersectsWith: (square) =>
    getRect().intersectsWith square.getRect()

  getRect: =>
    new Rect
      left: @position.x
      top: @position.y
      size: @size

  isMovable: ->
    rect = @getRect()

    return false unless @map.getRect().contains(rect)

    cells = [
      @map.getCell(rect.left, rect.top),
      @map.getCell(rect.left, rect.bottom),
      @map.getCell(rect.right, rect.top),
      @map.getCell(rect.right, rect.bottom)
    ]

    for cell in cells
      return false unless cell.passable

    return true
