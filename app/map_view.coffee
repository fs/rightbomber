class MapView extends BaseRepresentation
  constructor: (@map) ->

  render: ->
    rownum = 0
    table = $("<table/>", id: "map")
    table.css
      width:  @map.cols * @tileSize
      height: @map.rows * @tileSize

    while rownum < @map.rows
      colnum = 0
      tr = $("<tr>", { "data-row": rownum })

      while colnum < @map.cols
        cell = @map.getCell(colnum, rownum)
        td = $ "<td>",
          "data-row": rownum,
          "data-col": colnum,
          class: cell.getType()
        tr.append(td)
        colnum++

      rownum++
      table.append(tr)

    table
