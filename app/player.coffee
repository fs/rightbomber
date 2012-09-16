class Player extends SquaredObject
  moving: false
  size: 0.5
  velocity: 4 # grid element per second
  direction: 'up'

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

  plantBomb: =>
    unless @lastBomb
      console.log 'plant bomb'
      @lastBomb = new Bomb(@map, @) # adding to map and display

  getState: ->
    state = ['player']
    state.push 'moving' if @moving
    state.push @directionKey
    state

  update: ->
    @view.state = @getState()
    @view.update()

  intersectsWith: (object) ->
    intersects = super(object)

    if intersects
      if @lastBomb == object
        return false
    else
      @lastBomb = null if @lastBomb == object

    return intersects
