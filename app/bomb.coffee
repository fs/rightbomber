class Bomb extends SquaredObject

  constructor: (@map) ->
    super(@map)
    @setSize(0.6)
    @moveBy(5.2, 2.2)

    @representation = new ObjectView(@)
    @update()

  update: ->
    @representation.state = ['bomb']
    @representation.update()
