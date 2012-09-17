class ObjectView extends BaseView
  state: null
  square: null

  constructor: (@square) ->

  update: ->
    element = @getElement()

    x    = Math.round(@tileSize * @square.left)
    y    = Math.round(@tileSize * @square.top)
    size = Math.round(@tileSize * @square.size)

    element.className = @state.join ' '

    style = element.style

    if @opacity?
      style.opacity = @opacity

    style.left   = x + 'px'
    style.top    = y + 'px'
    style.width  = size + 'px'
    style.height = size + 'px'
