class MapView extends BaseView
  baseElement: '<table>'

  constructor: (@map) ->

  update: =>
    table = @getElement()

    table.attr id: "map"
    
    table.css
      width:  @map.width * @tileSize
      height: @map.height * @tileSize

    for y in [0...@map.height]
      tr = $ "<tr>"

      for x in [0...@map.width]
        td = $ "<td>", class: @map.getCell(x, y).getType()
        tr.append(td)

      table.append(tr)
