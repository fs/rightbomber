class Rect
  left: 0
  top: 0
  right: 1
  bottom: 1

  moveBy: (dx, dy) ->
    @left += dx
    @right += dx

    @top += dy
    @bottom += dy

  getWidth: ->
    @right - @left

  getHeight: ->
    @bottom - @top

  setWidth: (newWidth) ->
    @right = @left + newWidth

  setHeight: (newHeight) ->
    @bottom = @top + newHeight

  setSize: (newSize) ->
    @setWidth(newSize)
    @setHeight(newSize)

  intersectsWith: (rect) ->
    clear =
      (@left > rect.right) ||
      (@right < rect.left) ||
      (@top > rect.bottom) ||
      (@bottom < rect.top)

    ! clear

  compare: (a, b) =>
    a > b

  intersectionArea: (rect) ->
    return 0 unless @intersectsWith(rect)

    xes = [@left, @right, rect.left, rect.right].sort(@compare)
    ys = [@top, @bottom, rect.top, rect.bottom].sort(@compare)

    Math.abs( (xes[1] - xes[2]) * (ys[1] - ys[2]) )

  contains: (rect) ->
    @top    <= rect.top    &&
    @left   <= rect.left   &&
    @right  >= rect.right  &&
    @bottom >= rect.bottom

module.exports = Rect unless window?
