class SquaredObject extends Rect
  map: null
  size: 1
  moved: false
  velocity: 0
  direction: 0

  epsilon: 0.001

  constructor: (@map) ->
    @map.objects.push @
    @setSize(@size)

  setSize: (newSize) =>
    @size = newSize
    super(newSize)

  olderBy: (timeDelta) =>
    @moved = false
    distance = @velocity * timeDelta

    while distance > @size
      if @move(@size)
        @moved = true
        distance -= @size
      else
        break

    if distance > 0
      distance = Math.min(@size, distance)
      step = distance

      while Math.min(step, distance) > @epsilon
        if @move(step)
          @moved = true
          distance -= step
        else
          step /= 2

    @moved

  move: (distance) ->
    dx = 0
    dy = 0
    dx =  distance if @direction == 0
    dx = -distance if @direction == 2
    dy =  distance if @direction == 1
    dy = -distance if @direction == 3

    @moveBy(dx, dy)

    unless (movable = @isMovable())
      @moveBy(-dx, -dy)

    return movable

  isMovable: ->
    return false unless @map.contains(@)

    cells = [
      @map.getCell(@left, @top),
      @map.getCell(@left, @bottom),
      @map.getCell(@right, @top),
      @map.getCell(@right, @bottom)
    ]

    for cell in cells
      return false unless cell.passable

      for object in cell.objects
        return false if @intersectsWith(object)

    return true

  intersectsWith: (object) ->
    @ != object && super(object)
