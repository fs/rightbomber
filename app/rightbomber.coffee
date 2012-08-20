class Rightbomber
  constructor: ->
    console.log 'init'

  run: =>
    console.log 'run'

    map = new Map
    map.generate()

    mapView = new MapView(map)
    table = mapView.render()

    $(document.body).append(table)

    @keyboard = new Keyboard
    @keyboard.activate()

    @player = new Player
    @playerRepresentation = new Representation(document.body, @player)

    @player.isPassable = (position) ->
      # x1 = Math.floor(position.x - 0.4)
      # y1 = Math.floor(-position.y - 0.4)

      # x2 = Math.floor(position.x + 0.4)
      # y2 = Math.floor(-position.y + 0.4)

      x1 = Math.floor(position.x)
      y1 = Math.floor(position.y)

      x2 = Math.floor(position.x + 1)
      y2 = Math.floor(position.y + 1)

      # console.log(x1, y1, x2, y2)

      (x1 >= 0) && (y1 >= 0) &&
      (x2 < map.cols) && (y2 < map.rows) &&
      map.getCell(x1, y1).passable &&
      map.getCell(x1, y2).passable &&
      map.getCell(x2, y1).passable &&
      map.getCell(x2, y2).passable

    gameLoop = new GameLoop(@tick)
    gameLoop.run()




  tick: (timeDelta) =>
    @player.moving = false
    for direction in ['right', 'up', 'left', 'down']
      if @keyboard.keys[direction]
        @player.moving = true
        @player.setDirection(direction)

    @player.move(timeDelta)

    @playerRepresentation.update()
