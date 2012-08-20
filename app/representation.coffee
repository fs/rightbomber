class Representation
  constructor: (@world, @object) ->

  getElement: =>
    unless @element
      @element = $("<div>")
      $(@world).append(@element)

    @element

  update: =>
    element = @getElement()
    element.attr class: @object.toString()
    element.css
      left:  @object.position.x * 16 + 'px'
      top:  -@object.position.y * 16 + 'px'
