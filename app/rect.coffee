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

  intersectionArea: (rect) ->
    return 0 unless @intersectsWith(rect)

    # x1 = if @left <= rect.left <= @right then rect.left else rect.right
    # y1 = if @top <= rect.top <= @bottom then rect.top else rect.bottom

    # x2 = if @left < rect.left < @right then rect.left else rect.right
    # y2 = if @top < rect.top < @bottom then rect.top else rect.bottom

    # TODO: rewrite it with `if`s
    xes = [@left, rect.left, @right, rect.right].sort()
    ys =[@top, rect.top, @bottom, rect.bottom].sort()

    Math.abs( (xes[1] - xes[2]) * (ys[1] - ys[2]) )

  contains: (rect) ->
    @top    <= rect.top    &&
    @left   <= rect.left   &&
    @right  >= rect.right  &&
    @bottom >= rect.bottom
