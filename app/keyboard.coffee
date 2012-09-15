class Keyboard
  keyNames:
    38: 'up'
    40: 'down'
    37: 'left'
    39: 'right'
    87: 'w'
    83: 's'
    65: 'a'
    68: 'd'

  constructor: ->
    @keys = {}
    $(document).keydown(@keyDown)
    $(document).keyup(@keyUp)

  latestOf: (keyNames = []) ->
    latest = null
    for key in keyNames
      if @keys[key] > (@keys[latest] ? 0)
        latest = key
    latest

  keyDown: (event) =>
    keyName = @keyNames[event.keyCode]
    unless @keys[keyName]
      @keys[keyName] = @time()

  keyUp: (event) =>
    @keys[@keyNames[event.keyCode]] = 0

  time: ->
    (new Date).getTime()
