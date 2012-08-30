class Keyboard
  keyMap:
    38: 'up'
    40: 'down'
    37: 'left'
    39: 'right'
    191: 'slash'
  keys: {} # pressed keys
  constructor: ->
  activate: =>
    # $(document).keydown (e) => console.log e.keyCode
    $(document).keydown (e) => @keys[@keyMap[e.keyCode]] = true
    $(document).keyup   (e) => @keys[@keyMap[e.keyCode]] = false
