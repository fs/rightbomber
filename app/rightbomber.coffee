$ -> (new Rightbomber).run()

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

class Keyboard
  keyMap:
    38: 'up'
    40: 'down'
    37: 'left'
    39: 'right'
  keys: {} # pressed keys
  constructor: ->
  activate: =>
    $(document).keydown (e) => @keys[@keyMap[e.keyCode]] = true
    $(document).keyup   (e) => @keys[@keyMap[e.keyCode]] = false

class GameLoop
  constructor: (@loopFunction) ->
    @lastRunTime = @time()
  run: =>
    time = @time()
    delta = time - @lastRunTime
    @lastRunTime = time

    @loopFunction(delta)

    setTimeout @run, 0
  time: -> (new Date).getTime()
