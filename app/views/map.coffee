class MapView extends BaseView
  constructor: (@map) ->

  render: ->
    table = $ "<table>", id: "map"
    
    table.css
      width:  @map.width * @tileSize
      height: @map.height * @tileSize

    for y in [0...@map.height]
      tr = $ "<tr>"

      for x in [0...@map.width]
        td = $ "<td>", class: @map.getCell(x, y).getType()
        tr.append(td)

      table.append(tr)

    table
