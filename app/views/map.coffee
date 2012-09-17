class MapView extends BaseView
  baseElement: 'table'

  constructor: (@map) ->

  update: ->
    table = @getElement()

    table.id = "map"

    style = table.style
    style.width = @map.width * @tileSize
    style.height = @map.height * @tileSize

    for y in [0...@map.height]
      tr = @newElement('tr')

      for x in [0...@map.width]
        td = @newElement('td')
        td.className = @map.getCell(x, y).getType()

        tr.appendChild(td)

      table.appendChild(tr)
