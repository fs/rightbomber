class Bomb extends SquaredObject
  size: 0.5
  TTL: 3.0 # sec

  constructor: (@map, @player) ->
    super(@map)

    @moveBy(@player.left, @player.top)

    @exploded = false
    @representation = new ObjectView(@)
    @update()

  olderBy: (timeDelta) =>
    if @TTL < 0
      @exploded = true
      @update()
    else
      @TTL -= timeDelta

  update: ->
    @representation.state = ['bomb']
    @representation.state.push 'exploded' if @exploded
    @representation.update()

  intersectsWith: (object) ->
    @player != object && super(object)
