class Square # model
  map: null
  size: 1
  velocity: 0
  position: null
  direction: 0

  epsilon: 0.05

  constructor: (@map) ->
    @map.objects << @
    @position =
      x: 0
      y: 0

  move: (timeDelta) =>
    moved = false
    velocity = @velocity * timeDelta

    while velocity > 1
      if @moveBy(1)
        moved = true
        velocity -= 1
      else
        break

    if velocity <= 1 && @moveBy(velocity)
      moved = true
      velocity = 0

    if velocity > 0
      while velocity > @epsilon
        dv = velocity / 2
        if @moveBy(dv)
          moved = true
          velocity -= dv
        else
          velocity = dv

    moved


  moveBy: (velocity) ->
    dx = 0
    dy = 0
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
