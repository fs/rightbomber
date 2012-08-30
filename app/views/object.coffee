class ObjectView extends BaseView
  state: null
  square: null

  constructor: (@square) ->

  update: =>
    element = @getElement()

    newX = parseInt(@square.position.x * @tileSize)
    newY = parseInt(@square.position.y * @tileSize)

    element.attr class: @state.join ' '

    element.css
      left: newX + 'px'
      top:  newY + 'px'
      width: @tileSize * @square.size + 'px'
      height: @tileSize * @square.size + 'px'
