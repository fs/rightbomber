class Bomb extends SquaredObject

  constructor: (@map, @player) ->
    super(@map)
    @setSize(0.6)
    @moveBy(@player.left, @player.top)

    @representation = new ObjectView(@)

  olderBy: (timeDelta) =>
    @update()

  update: ->
    @representation.state = ['bomb']
    @representation.update()

  intersectsWith: (object) ->
    @player != object && super(object)
