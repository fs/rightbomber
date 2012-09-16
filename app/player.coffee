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

  plantBomb: =>
    unless @lastBomb
      console.log 'plant bomb'
      @lastBomb = new Bomb(@) # adding to map and display
      # @onBomb = true


  getState: ->
    state = ['player']
    state.push 'moving' if @moving
    state.push @directionKey
    state

  update: =>
    @view.state = @getState()
    @view.update()

  intersectsWith: (object) ->
    intersects = super(object)

    if object instanceof Bomb
      if intersects
        if object == @lastBomb or object.exploded
          return false
      else
        if object == @lastBomb
          @lastBomb = null

    return intersects



