class Representation
  constructor: (@world, @object) ->

  getElement: =>
    unless @element
      @element = $("<div>")
      $(@world).append(@element)

    @element

  update: =>
    @getElement().attr class: @object.toString()
