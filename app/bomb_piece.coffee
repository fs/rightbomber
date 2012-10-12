class BombPiece extends SquaredObject
  velocity: 20
  acceleration: -25
  size: 0.3

  constructor: (@bomb) ->
    super(@bomb.map)

    @moveBy(@bomb.left, @bomb.top)

    @initialVelocity = @velocity *= Math.log(Math.random() + 1)

    @direction.random(false)

    @representation = new ObjectView(@)
    @update()

  olderBy: (timeDelta) =>
    if @velocity > 0
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

  intersectsWith: (object) ->
    if object instanceof Cell
      @bomb != object && super(object)
    else
      return false
