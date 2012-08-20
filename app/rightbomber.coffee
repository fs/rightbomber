class Rightbomber
  constructor: ->
    console.log 'init'

  run: =>
    console.log 'run'

    @keyboard = new Keyboard
    @keyboard.activate()

    @player = new Player
    @playerRepresentation = new Representation(document.body, @player)

    gameLoop = new GameLoop(@tick)
    gameLoop.run()

  tick: (timeDelta) =>
    @player.moving = false
    for direction in ['right', 'up', 'left', 'down']
      if @keyboard.keys[direction]
        @player.moving = true
        @player.setDirection(direction)

    @player.move(timeDelta)

    @playerRepresentation.update()
