class Player
  moving: false
  direction: 1

  directionMap:
    0: 'right'
    1: 'up'
    2: 'left'
    3: 'down'
    'right': 0
    'up'   : 1
    'left' : 2
    'down' : 3

  constructor: () -> # @renderer = new PlayerRenderer

  setDirection: (directionString) =>
    @direction = @directionMap[directionString]
    console.log @toString()

  toString: =>
    state = ['player']
    state.push 'moving' if @moving
    state.push @directionMap[@direction]
    state.join ' '

  # render to html

  render: =>
    @element = $("<div>") unless @element?
    @element.attr class: @toString()

    $(document.body).append @element
