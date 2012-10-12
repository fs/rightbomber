class Keyboard
  keyNames:
    190: '.' # place bomb
    38: 'up'
    40: 'down'
    37: 'left'
    39: 'right'

    70: 'f' # place bomb
    87: 'w'
    83: 's'
    65: 'a'
    68: 'd'

  constructor: ->
    @keys = {}
    document.onkeydown = @keyDown
    document.onkeyup = @keyUp

  latestOf: (keyNames = []) ->
    latest = null
    for key in keyNames
      if @keys[key] > (@keys[latest] ? 0)
        latest = key
    latest

  isKeyPressed: (keyName) ->
    !!@keys[keyName]

  keyDown: (event) =>
    keyName = @keyNames[event.keyCode]
    # console.log(event.keyCode) unless keyName
    unless @keys[keyName]
      @keys[keyName] = @time()

  keyUp: (event) =>
    keyName = @keyNames[event.keyCode]
    @keys[keyName] = 0

  time: ->
    (new Date).getTime()
