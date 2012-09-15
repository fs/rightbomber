class Cell extends Rect
  passable: true

  constructor: (x, y) ->
    @objects = []
    @moveBy(x, y)

  getType: ->
    if @passable
      'grass'
    else
      'stone'
