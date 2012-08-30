class Bomb
  map: null
  square: null

  constructor: (@map) ->
    @square = new Square(@map)
    @square.size = 0.6
    @square.position.x = 5.2
    @square.position.y = 2.2

    @representation = new ObjectView(@square)
    @update()

  update: ->
    @representation.state = ['bomb']
    @representation.update()

