class Keyboard
  keyMap:
    38: 'up'
    40: 'down'
    37: 'left'
    39: 'right'
    87: 'w'
    83: 's'
    65: 'a'
    68: 'd'
  keys: {} # pressed keys
  constructor: ->
  activate: =>
    $(document).keydown (e) => @keys[@keyMap[e.keyCode]] = true
    $(document).keyup   (e) => @keys[@keyMap[e.keyCode]] = false
