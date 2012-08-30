class Representation # view
  state: null

  constructor: (@square) ->

  getElement: =>
    unless @element
      @element = $("<div>")
      $(document.body).append(@element)
    @element

  update: =>
    element = @getElement()

    newX = parseInt(@square.position.x * 16)
    newY = parseInt(@square.position.y * 16)

    element.attr class: @state.join ' '

    element.css
      left: newX + 'px'
      top:  newY + 'px'
