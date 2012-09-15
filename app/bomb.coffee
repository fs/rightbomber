class Bomb extends SquaredObject

  constructor: (@map, @player) ->
    super(@map)
    @setSize(0.6)
    @moveBy(@player.square.left, @player.square.top)

    @representation = new ObjectView(@)

  olderBy: (timeDelta) =>
    @update()

  update: ->
    @representation.state = ['bomb']
    @representation.update()

  intersectsWith: (object) ->
    console.log 'int with bo'
    @player != object && super(object)
