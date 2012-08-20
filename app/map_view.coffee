class MapView
  constructor: (@map) ->
    console.log "map: view init"

  render: ->
    rownum = 0
    table = $("<table/>", id: "map")

    while rownum < @map.rows
      colnum = 0
      tr = $("<tr>", { "data-row": rownum })

      while colnum < @map.cols
        cell = @map.getCell(rownum, colnum)
        td = $ "<td>",
          "data-row": rownum,
          "data-col": colnum,
          class: cell.getType()
        tr.append(td)
        colnum++

      rownum++
      table.append(tr)

    table
