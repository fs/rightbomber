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
    @player2 = new Player(map) # controller

    @bombs = []

    gameLoop = new GameLoop(@tick)
    gameLoop.run()

  tick: (timeDelta) =>
    @player.moving = false
    for direction in ['right', 'up', 'left', 'down']
      if @keyboard.keys[direction]
        @player.moving = true
        @player.direction = direction

    if @keyboard.keys['/']
      @bombs.push @player.placeBomb()

    for bomb in @bombs
      bomb.move(timeDelta)

    @player.move(timeDelta)

    @player2.moving = false
    for key, direction of {d: 'right', w: 'up', a: 'left', s: 'down'}
      if @keyboard.keys[key]
        @player2.moving = true
        @player2.direction = direction

    @player2.move(timeDelta)
