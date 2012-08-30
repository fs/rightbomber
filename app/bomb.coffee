class Bomb
  map: null
  square: null

  constructor: (@player) ->
    @map = @player.map
    @square = new Square(@map)
    @square.size = 0.6
    @square.position.x = @player.square.position.x
    @square.position.y = @player.square.position.y

    @representation = new Representation(@square)
    @update()

  move: (timeDelta) =>

  update: ->
    @representation.state = ['bomb']
    @representation.update()

