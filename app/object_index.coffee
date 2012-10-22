class ObjectIndex extends Rect
  objects: []

  push: (object) ->
    @pushUp(object) unless @pushDown(object)

  pushUp: (object) ->
    parent = @quadruple()

    loop
      break if parent.contains(object)

      parent.moveBy(-width, 0)
      break if parent.contains(object)

      parent.moveBy(0, -height)
      break if parent.contains(object)

      parent.moveBy(width, 0)
      break if parent.contains(object)

      parent.pushUp(object)
      break

  pushDown: (object) ->
    if pushed = @contains(object)
      @objects.push object

      for child in @children()
        break if child.pushDown(object)

    return pushed

  # Creates 4 children each 4 times smaller than this
  # Children numeration:
  #
  # 3 | 1
  # --+--
  # 2 | 0
  #
  children: ->
    @children ||= []

    # left top
    @children[3] ||= @quarter(true, true)

    # left bottom
    @children[2] ||= @quarter(true, false)

    # right top
    @children[1] ||= @quarter(false, true)

    # right bottom
    @children[0] ||= @quarter(false,  false)

    @children

  # Constructs a new node 4 times bigger than this
  quadruple: ->
    node = new @constructor
    node.setWidth  @getWidth()  * 2
    node.setHeight @getHeight() * 2
    node

  # Constructs a new node 4 times smaller than this
  # It could moved in 4 different positions afterwards:
  #
  #   leftmost | topmost
  #   topmost  |
  #   ---------+---------
  #   leftmost |
  #            |
  #
  quarter: (leftmost, topmost) ->
    halfWidth  = @getWidth()  / 2
    halfHeight = @getHeight() / 2

    left = leftmost ? 0 : halfWidth
    top  = topmost  ? 0 : halfHeight

    node = new @constructor
    node.moveBy(@left + left, @top + top)
    node.setWidth  halfWidth
    node.setHeight halfHeight
    node
