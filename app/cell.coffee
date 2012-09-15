class Cell extends Rect
  passable: true

  constructor: (x, y) ->
    @moveBy(x, y)

  getType: =>
    if @passable
      'grass'
    else
      'stone'
