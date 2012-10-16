class ObjectIndex extends Rect
  objects: []

  push: (object, pushedUpFrom = null) ->
    if @contains(object)
      @objects.push object

      for child in @children()
        pushedDown   = child != pushedUpFrom
        pushedDown &&= child.push(object)
        break if pushedDown

      return true

    else
      @parent().push(object, @)

  parent: ->
    @parent ||= new @constructor

  children: ->
    unless @children
      @children = []

      # top left
      @children.push @subRect(false, false)

      # top right
      @children.push @subRect(true,  false)

      # bottom left
      @children.push @subRect(false, true)

      # bottom right
      @children.push @subRect(true,  true)

    @children

  subRect: (left, top) ->
    width  = @getWidth()  / 2
    height = @getHeight() / 2

    left = left ? width  : 0
    top  = top  ? height : 0

    rect = new Rect
    rect.moveBy(@left + left, @top + top)
    rect.setWidth(width)
    rect.setHeight(height)

    rect
