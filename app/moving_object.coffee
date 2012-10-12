class MovingObject extends BasicObject
  moved: false
  velocity: 0

  epsilon: 0.001

  constructor: (@map) ->
    super @map
    @direction = new Direction()

  olderBy: (timeDelta) ->
    distanceToGo = distance = @velocity * timeDelta

    distanceToGo = @sprint(distanceToGo) if distanceToGo > 0

    distanceToGo = @comeCloser(distanceToGo) if distanceToGo > 0

    distanceToGo = @cutCorners(distanceToGo) if distanceToGo > 0

    distanceToGo < distance

  sprint: (distance) ->
    step = @size

    throw 'Too small to move with high speed' if distance > step && step / distance < @epsilon

    while distance > step
      if @move(step)
        distance -= step
      else
        break

    distance

  comeCloser: (distance) ->
    distance = Math.min(@size, distance)
    step = distance

    while Math.min(step, distance) > @epsilon
      if @move(step)
        distance -= step
      else
        step /= 2

    distance

  cutCorners: (distance) ->
    dx = @direction.dx(distance)
    dy = @direction.dy(distance)

    @moveBy(dx, dy)
    @direction.save()

    impactArea = @blockedArea()

    @direction.restore().rotateLeft()
    leftArea = @blockedAreaAt(distance)

    @direction.restore().rotateRight()
    rightArea = @blockedAreaAt(distance)

    @moveBy(-dx, -dy)

    if leftArea > rightArea
      area = rightArea
      @direction.restore().rotateRight()
    else
      area = leftArea
      @direction.restore().rotateLeft()

    if area < Math.min(impactArea, @size * distance)
      if @move(distance)
        distance = 0

    @direction.restore()
    distance

  move: (distance) ->
    dx = @direction.dx(distance)
    dy = @direction.dy(distance)

    @moveBy(dx, dy)

    unless (movable = @isMovable())
      @moveBy(-dx, -dy)

    movable

  blockedAreaAt: (distance) ->
    dx = @direction.dx(distance)
    dy = @direction.dy(distance)

    @moveBy(dx, dy)

    area = @blockedArea()

    @moveBy(-dx, -dy)

    area

  isMovable: ->
    return false unless @map.contains(@)

    for object in @map.objects
      return false if @intersectsWith(object)

    return true

  blockedArea: ->
    return @size * @size unless @map.contains(@)

    area = 0

    for object in @map.objects
      area += @intersectionArea(object)

    area
