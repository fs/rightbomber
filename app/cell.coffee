class Cell extends Rect
  passable: true

  constructor: (x, y) ->
    @objects = []
    @moveBy(x, y)

  olderBy: (timeDelta) ->

  getType: ->
    if @passable
      'grass'
    else
      'stone'
