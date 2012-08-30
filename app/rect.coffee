class Rect
  left: 0
  top: 0
  right: 1
  bottom: 1

  constructor: (dimensions) ->
    width = dimensions.width ? dimensions.size
    height = dimensions.height ? dimensions.size

    @left = dimensions.left ? (dimensions.right - width)
    @top = dimensions.top ? (dimensions.bottom - height)
    @right = dimensions.right ? @left + width
    @bottom = dimensions.bottom ? @top + height

  instersectsWith: (rect) =>
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
