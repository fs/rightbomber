class Bomb extends MovingObject
  size: 0.9
  TTL: 3.0 # sec

  constructor: (@player) ->
    @exploded = false
    @timer = @TTL

    super(@player.map)

    @moveBy(@player.left + (@player.size - @size) / 2, # coords of player`s center position
            @player.top + (@player.size - @size) / 2)
    @representation = new ObjectView(@)
    @update()

  olderBy: (timeDelta) =>
    if !@exploded and @timer < 0
      @explode()
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
