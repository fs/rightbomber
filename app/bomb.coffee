class Bomb extends SquaredObject
  size: 0.6

  constructor: (@map, @player) ->
    super(@map)

    @moveBy(@player.left, @player.top)

    @representation = new ObjectView(@)
    @update()

  olderBy: (timeDelta) =>

  update: ->
    @representation.state = ['bomb']
    @representation.update()

  intersectsWith: (object) ->
    @player != object && super(object)
