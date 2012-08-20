class Rightbomber
  constructor: ->
    console.log 'init'

  run: =>
    console.log 'run'

    @keyboard = new Keyboard
    @keyboard.activate()

    @player = new Player

    @playerElement = @player.render()
    $(document.body).append(@playerElement)

    gameLoop = new GameLoop(@tick)
    gameLoop.run()

  tick: (timeDelta) =>
    for direction in ['right', 'up', 'left', 'down']
      if @keyboard.keys[direction]
        @player.moving = true
        @player.setDirection(direction)

      @player.render()

# player.render() # => html

# playerView = new PlayerView(player)
# playerView.render() # => html
