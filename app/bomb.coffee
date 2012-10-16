class Bomb extends MovingObject
  pieces: 50
  size: 0.75
  timer: 3.0 # sec

  constructor: (@player) ->
    super(@player.map)

    playerCenter = (@player.size - @size) / 2
    @moveBy(@player.left + playerCenter, @player.top + playerCenter)

    @representation = new ObjectView(@)
    @update()

  olderBy: (timeDelta) =>
    if @exploded()
      if @pieces > 0
        @emit()
        if @pieces == 0
          @update()
    else
      @timer -= timeDelta

  emit: ->
    newPieces = Math.round @pieces / 2
    @pieces -= newPieces
    while newPieces > 0
      new BombPiece(@)
      newPieces -= 1

  explode: ->
    @timer = 0

  exploded: ->
    @timer <= 0

  update: ->
    @representation.state = ['bomb']
    @representation.state.push 'exploded' if @exploded()
    @representation.update()

  intersectableWith: (object) ->
    ! @exploded() &&
    super(object)
