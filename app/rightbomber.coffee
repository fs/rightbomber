class Rightbomber
  constructor: ->
    console.log 'init'
  run: =>
    console.log 'run'

    keyboard = new Keyboard
    keyboard.activate()

    gameLoop = new GameLoop (timeDelta) =>
      console.log "loop body"

    gameLoop.run()
