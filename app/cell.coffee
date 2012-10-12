class Cell extends BasicObject
  passable: true

  constructor: (x, y) ->
    @objects = []
    @moveBy(x, y)

  olderBy: (timeDelta) ->

  intersectableWith: (object) ->
    ! @passable &&
    super(object)

  getType: ->
    if @passable
      'grass'
    else
      'stone'
