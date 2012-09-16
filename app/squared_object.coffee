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
    distanceToGo = distance = @velocity * timeDelta

    distanceToGo = @sprint(distanceToGo) if distanceToGo > 0

    distanceToGo = @comeCloser(distanceToGo) if distanceToGo > 0

    distanceToGo = @cutCorners(distanceToGo) if distanceToGo > 0

    distanceToGo < distance

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
    dx = @dx(distance, @direction)
    dy = @dy(distance, @direction)

    @moveBy(dx, dy)

    left = @rotateLeft(@direction)
    leftArea = @blockedAreaAt(distance, left)

    right = @rotateRight(@direction)
    rightArea = @blockedAreaAt(distance, right)

    @moveBy(-dx, -dy)

    direction = if leftArea > rightArea then right else left

    if @move(distance, direction)
      return 0

    distance

  move: (distance, direction) ->
    dx = @dx(distance, direction)
    dy = @dy(distance, direction)

    @moveBy(dx, dy)

    unless (movable = @isMovable())
      @moveBy(-dx, -dy)

    movable

  blockedAreaAt: (distance, direction) ->
    dx = @dx(distance, direction)
    dy = @dy(distance, direction)

    @moveBy(dx, dy)

    area = @blockedArea()

    @moveBy(-dx, -dy)

    area

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
    (direction + 3) % 4

  rotateRight: (direction) ->
    (direction + 1) % 4

  intersectsWith: (object) ->
    @ != object && super(object)

  cells: ->
    [
      @map.getCell(@left, @top),
      @map.getCell(@left, @bottom),
      @map.getCell(@right, @top),
      @map.getCell(@right, @bottom)
    ]

  isMovable: ->
    return false unless @map.contains(@)

    for cell in @cells()
      return false unless cell.passable

      for object in cell.objects
        return false if @intersectsWith(object)

    return true

  blockedArea: ->
    return @size * @size unless @map.contains(@)

    area = 0
    for cell in @cells()
      area += @intersectionArea(cell) unless cell.passable

      for object in cell.objects
        area += @intersectionArea(object)

    area
