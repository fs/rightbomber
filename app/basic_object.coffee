class BasicObject extends Rect
  map: null
  size: 1

  constructor: (@map) ->
    @map.push @
    @setSize(@size)

  setSize: (newSize) ->
    @size = newSize
    super(newSize)

  # Redefine in subclasses
  intersectableWith: (object) ->
    @ != object

  intersectsWith: (object) ->
    @intersectableWith(object) &&
    object.intersectableWith(@) &&
    super(object)
