class Rect
  left: 0
  top: 0
  right: 1
  bottom: 1

  moveBy: (dx, dy) =>
    @left += dx
    @right += dx

    @top += dy
    @bottom += dy

  getWidth: =>
    @right - @left

  getHeight: =>
    @bottom - @top

  setWidth: (newWidth) =>
    @right = @left + newWidth

  setHeight: (newHeight) =>
    @bottom = @top + newHeight

  setSize: (newSize) =>
    @setWidth(newSize)
    @setHeight(newSize)

  intersectsWith: (rect) =>
    clear =
      (@left > rect.right) ||
      (@right < rect.left) ||
      (@top > rect.bottom) ||
      (@bottom < rect.top)

    ! clear

  contains: (rect) =>
    (@left <= rect.left) &&
    (@right >= rect.right) &&
    (@top <= rect.top) &&
    (@bottom >= rect.bottom)
