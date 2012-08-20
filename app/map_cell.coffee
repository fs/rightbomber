class MapCell
  passable: true

  constructor: (@rownum, @colnum) ->

  getType: =>
    if @passable
      'grass'
    else
      'stone'
