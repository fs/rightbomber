class BaseView
  tileSize: 24
  baseElement: 'div'

  getContainer: ->
    document.getElementById('game')

  newElement: (tag) ->
    document.createElement(tag)

  getElement: ->
    unless @element
      @element = @newElement(@baseElement)
      @getContainer().appendChild(@element)

    @element
