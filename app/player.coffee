class Player extends MovingObject
  moving: false
  size: 0.75
  velocity: 4 # grid element per second

  constructor: (@map) -> # @renderer = new PlayerRenderer
    super(@map)

    @view = new ObjectView(@)
    @update()

  face: (direction) ->
    @facing = direction
    @direction[@facing]()

  olderBy: (timeDelta) =>
    if @moving && super(timeDelta)
      @update()

  plantBomb: =>
    unless @lastBomb
      @lastBomb = new Bomb(@) # adding to map and display

  getState: ->
    state = ['player']
    state.push 'moving' if @moving
    state.push @facing
    state

  update: ->
    @view.state = @getState()
    @view.update()

  intersectsWith: (object) ->
    intersects = super(object)

    if object == @lastBomb
      unless intersects
        @lastBomb = null
      intersects = false

    intersects
