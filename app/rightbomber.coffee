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

    @player = new Player(map) # controller
    @player_2 = new Player(map) # controller

    gameLoop = new GameLoop(@tick)
    gameLoop.run()

  tick: (timeDelta) =>
    @player.moving = false
    for direction in ['right', 'up', 'left', 'down']
      if @keyboard.keys[direction]
        @player.moving = true
        @player.direction = direction

    @player.move(timeDelta)

    @player_2.moving = false
    for direction in ['d', 'w', 'a', 's']
      if @keyboard.keys[direction]
        @player_2.moving = true
        @player_2.direction = direction

    @player_2.move(timeDelta)
