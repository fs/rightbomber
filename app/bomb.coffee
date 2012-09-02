class Bomb
  map: null
  square: null

  constructor: (@map) ->
    @square = new SquaredObject(@map)
    @square.size = 0.6
    @square.left = 5.2
    @square.top = 2.2

    @representation = new ObjectView(@square)
    @update()

  update: ->
    @representation.state = ['bomb']
    @representation.update()

