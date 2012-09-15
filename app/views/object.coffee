class ObjectView extends BaseView
  state: null
  square: null

  constructor: (@square) ->

  update: ->
    element = @getElement()

    x    = Math.round(@tileSize * @square.left)
    y    = Math.round(@tileSize * @square.top)
    size = Math.round(@tileSize * @square.size)

    element.attr class: @state.join ' '

    element.css
      left  : x + 'px'
      top   : y + 'px'
      width : size + 'px'
      height: size + 'px'
