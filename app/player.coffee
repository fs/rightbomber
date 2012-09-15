class Player extends SquaredObject
  moving: false
  size: 0.5
  velocity: 4

  directionMap:
    right: 0
    down : 1
    left : 2
    up   : 3

  constructor: (@map) -> # @renderer = new PlayerRenderer
    super(@map)

    @view = new ObjectView(@)
    @update()

  setDirection: (@directionKey) ->
    @direction = @directionMap[@directionKey]

  olderBy: (timeDelta) =>
    if @moving && super(timeDelta)
      @update()

  getBomb: =>
    new Bomb(@map, @)

  getState: ->
    state = ['player']
    state.push 'moving' if @moving
    state.push @directionKey
    state

  update: =>
    @view.state = @getState()
    @view.update()
