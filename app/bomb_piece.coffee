class BombPiece extends SquaredObject
  velocity: 10
  size: 0.3

  constructor: (@bomb) ->
    super(@bomb.map)

    @moveBy(@bomb.left, @bomb.top)

    @maxVelocity = Math.random() * 10 + 5
    @velocity = @maxVelocity

    @direction = 4*Math.random()
    @direction = 0 if @direction == 4

    @representation = new ObjectView(@)
    @update()

  olderBy: (timeDelta) =>
    @velocity = @velocity - 0.1 # or * 0.98
    @setSize(@size / 1.01) # if @size < 1

    if @velocity < @epsilon
      @velocity = 0

    if super(timeDelta)
      @update()
    else if @velocity > 0
      @velocity = 0
      @update()

  update: ->
    @representation.opacity = @velocity / @maxVelocity
    @representation.state = ['bomb-piece']
    @representation.update()

  cutCorners: (distance) ->
    distance

  intersectsWith: (object) ->
    if object instanceof BombPiece
      return false
    else
      @bomb != object && super(object)
