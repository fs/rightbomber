class BombPiece extends MovingObject
  velocity: 10
  acceleration: -10
  size: 0.3

  constructor: (@bomb) ->
    super(@bomb.map)

    @moveBy(@bomb.left, @bomb.top)

    @initialVelocity = @velocity *= Math.log(Math.random() + 1)
    @acceleration *= (Math.random() + 1) / 2

    @direction.random(false)

    @representation = new ObjectView(@)
    @update()

  setSize: (newSize) ->
    delta = - (newSize - @size) / 2
    @moveBy(delta, delta)

    super(newSize)

  olderBy: (timeDelta) =>
    if @velocity > 0
      # @setSize(@size + 1/(@size + 10))

      @velocity += @acceleration * timeDelta

      if @velocity < @epsilon
        @velocity = 0

      unless super(timeDelta)
        @velocity = 0

      @update()

  update: ->
    @representation.opacity = @velocity / @initialVelocity
    @representation.state = ['bomb-piece']
    @representation.update()

  cutCorners: (distance) -> distance

  intersectableWith: (object) ->
    @velocity > 0 &&
    ! (object instanceof BombPiece) &&
    super(object)

  intersectsWith: (object) ->
    intersects = super(object)

    if (object instanceof Bomb) && intersects
      object.explode()

    intersects
