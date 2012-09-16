class Bomb extends SquaredObject
  size: 0.6
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
      @exploded = true
      @update()
    else
      @timer -= timeDelta

  update: ->
    @representation.state = ['bomb']
    @representation.state.push 'exploded' if @exploded
    @representation.update()

  intersectsWith: (object) ->
    @player != object && super(object)
