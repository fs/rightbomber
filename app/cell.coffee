class Cell
  x: 0
  y: 0
  passable: true

  constructor: (@x, @y) ->

  getRect: =>
    new Rect
      left: @x
      top: @y
      size: 1

  getType: =>
    if @passable
      'grass'
    else
      'stone'
