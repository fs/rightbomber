class Bomb extends SquaredObject
  size: 0.5
  TTL: 3.0 # sec

  constructor: (@player) ->
    @exploded = false
    @timer = @TTL

    super(@player.map)

    @moveBy(@player.left, @player.top)
    @representation = new ObjectView(@)
    @update()

  olderBy: (timeDelta) =>
    if !@exploded and @timer < 0
      @explode()
      @update()
    else
      @timer -= timeDelta

  explode: ->
    @exploded = true

    for i in [0..50]
      piece = new BombPiece(@)

  update: ->
    @representation.state = ['bomb']
    @representation.state.push 'exploded' if @exploded
    @representation.update()

  intersectsWith: (object) ->
    @player != object && super(object)
