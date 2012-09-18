class Dummy extends SquaredObject
  constructor: (@map) ->
    super(@map)

    @view = new ObjectView(@)
    @update()

  randomPlacement: ->
    loop
      x = @map.getWidth() * Math.random()
      y = @map.getHeight() * Math.random()
      @moveBy(x, y)
      break if @isMovable()
      @moveBy(-x, -y)

  update: ->
    @view.state = ['dummy']
    @view.update()
