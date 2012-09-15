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

  setSize: (newSize) ->
    @size = newSize
    super(newSize)

  olderBy: (timeDelta) ->
    distance = distanceToGo = @velocity * timeDelta

    distance = @sprint(distance) if distance > 0

    distance = @comeCloser(distance) if distance > 0

    distance = @cutCorners(distance) if distance > 0

    distance < distanceToGo

  sprint: (distance) ->
    step = @size

    while distance > step
      if @move(step, @direction)
        distance -= step
      else
        break

    distance

  comeCloser: (distance) ->
    distance = Math.min(@size, distance)
    step = distance

    while Math.min(step, distance) > @epsilon
      if @move(step, @direction)
        distance -= step
      else
        step /= 2

    distance

  cutCorners: (distance) ->
    direction = @rotateLeft(@direction)
    moved = @move(distance, direction)

    unless moved
      direction = @rotateRight(@direction)
      moved = @move(distance, direction)

    if moved then 0 else distance

  move: (distance, direction) ->
    dx = @dx(distance, direction)
    dy = @dy(distance, direction)

    @moveBy(dx, dy)

    unless (movable = @isMovable())
      @moveBy(-dx, -dy)

    movable

  dx: (distance, direction) ->
    switch direction
      when 0
        distance
      when 2
        -distance
      else
        0

  dy: (distance, direction) ->
    switch direction
      when 1
        distance
      when 3
        -distance
      else
        0

  rotateLeft: (direction) ->
    (direction + 5) % 4

  rotateRight: (direction) ->
    (direction + 7) % 4

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
        return false if @ != object && @intersectsWith(object)

    return true
