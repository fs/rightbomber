class Player # controller
  map: null
  square: null

  moving: false
  velocity: 4 # grid element per second
  direction: 'up'

  directionMap:
    'right': 0
    'up'   : 3
    'left' : 2
    'down' : 1

  constructor: (@map) -> # @renderer = new PlayerRenderer
    @square = new Square(@map)
    @square.size = 0.5

    @representation = new Representation(@square)
    @update()

  move: (timeDelta) =>
    if @moving
      @square.velocity = @velocity
      @square.direction = @directionMap[@direction]
      if @square.move(timeDelta)
        @update()

  getBomb: =>
    new Bomb(@)

  getState: ->
    state = ['player']
    state.push 'moving' if @moving
    state.push @direction
    state

  update: ->
    @representation.state = @getState()
    @representation.update()
