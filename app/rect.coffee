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

    x1 = @getInsideCornerX(rect)
    y1 = @getInsideCornerY(rect)

    x2 = rect.getInsideCornerX(@)
    y2 = rect.getInsideCornerY(@)

    Math.abs( (x1 - x2) * (y1 - y2) )

  getInsideCornerX: (rect) ->
    if @left < rect.left < @right
      rect.left
    else
      rect.right

  getInsideCornerY: (rect) ->
    if @top < rect.top < @bottom
      rect.top
    else
      rect.bottom

  contains: (rect) ->
    @top    <= rect.top    &&
    @left   <= rect.left   &&
    @right  >= rect.right  &&
    @bottom >= rect.bottom
