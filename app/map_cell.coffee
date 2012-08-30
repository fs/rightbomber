class MapCell
  passable: true

  constructor: (@rownum, @colnum) ->

  getRect: =>
    new Rect
      left: @rownum
      top: @rownum
      size: 1

  getType: =>
    if @passable
      'grass'
    else
      'stone'
