class Player # controller
  map: null
  square: null

  moving: false
  velocity: 4 # grid element per second
  direction: 'up'

  directionMap:
    right: 0
    up   : 3
    left : 2
    down : 1

  constructor: (@map) -> # @renderer = new PlayerRenderer
    @square = new SquaredObject(@map)
    @square.setSize(0.5)

    @view = new ObjectView(@square)
    @update()

  olderBy: (timeDelta) ->
    if @moving
      @square.velocity = @velocity
      @square.direction = @directionMap[@direction]
      if @square.olderBy(timeDelta)
        @update()

  getState: ->
    state = ['player']
    state.push 'moving' if @moving
    state.push @direction
    state

  update: ->
    @view.state = @getState()
    @view.update()
