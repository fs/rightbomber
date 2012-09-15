class BaseView
  tileSize: 24
  element: null
  baseElement: '<div>'

  getElement: ->
    unless @element
      @element = $ @baseElement
      $(document.body).append(@element)
    @element
