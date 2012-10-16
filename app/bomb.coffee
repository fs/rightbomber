class Bomb extends MovingObject
  pieces: 50
  size: 0.9
  timer: 3.0 # sec

  constructor: (@player) ->
    super(@player.map)

    @moveBy(@player.left + (@player.size - @size) / 2, # coords of player`s center position
            @player.top + (@player.size - @size) / 2)
    @representation = new ObjectView(@)
    @update()

  olderBy: (timeDelta) =>
    if @timer < 0
      if @pieces > 0
        new BombPiece(@)
        @pieces -= 1
      else if @pieces == 0
        @update()
    else
      @timer -= timeDelta

  explode: ->
    @exploded = true

    for i in [0..50]
      piece = new BombPiece(@)

    @update()

  update: ->
    @representation.state = ['bomb']
    @representation.state.push 'exploded' if @exploded
    @representation.update()

  intersectableWith: (object) ->
    ! @exploded &&
    super(object)
