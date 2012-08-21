class Representation
  constructor: (@world, @object) ->

  getElement: =>
    unless @element
      @element = $("<div>")
      $(@world).append(@element)

    @element

  update: =>
    element = @getElement()

    newX = parseInt(@object.position.x * 16)
    newY = parseInt(@object.position.y * 16)
    newClass = @object.toString()

    if (newX != @oldX) || (newY != @oldY) || (newClass != @oldClass)
      element.attr class: newClass
      element.css
        left: newX + 'px'
        top:  newY + 'px'
      [@oldX, @oldY, @oldClass] = [newX, newY, newClass]
