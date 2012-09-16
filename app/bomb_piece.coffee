class BombPiece extends SquaredObject
  velocity: 10
  size: 0.3

  constructor: (@bomb) ->
    super(@bomb.map)

    @moveBy(@bomb.left, @bomb.top)
    @velocity = Math.random() * 20 + 5

    @direction = 4*Math.random()
    @direction = 0 if @direction == 4

    @representation = new ObjectView(@)
    @update()

  olderBy: (timeDelta) =>
    if super(timeDelta)
      @update()

  update: ->
    @representation.state = ['bomb-piece']
    @representation.update()

  intersectsWith: (object) ->
    if object instanceof BombPiece
      return false
    else
      @bomb != object && super(object)
