class Rightbomber
  constructor: ->
    console.log 'init'

  run: =>
    console.log 'run'

    @keyboard = new Keyboard
    @keyboard.activate()

    @player = new Player

    gameLoop = new GameLoop(@tick)
    gameLoop.run()

  tick: (timeDelta) =>
    for direction in ['right', 'up', 'left', 'down']
      if @keyboard.keys[direction]
        @player.moving = true
        @player.setDirection(direction)

    @player.render() # to page

# player.render() # => html

# playerView = new PlayerView(player)
# playerView.render() # => html
