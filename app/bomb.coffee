class Bomb
  map: null
  square: null

  constructor: (@player) ->
    @square = new SquaredObject(@player)
    @square.size = 0.6
    @square.left = @player.square.left
    @square.top = @player.square.top

    @representation = new ObjectView(@square)
    # @update()

  olderBy: (timeDelta) =>
    @update()

  update: ->
    @representation.state = ['bomb']
    @representation.update()

