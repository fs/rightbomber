class Rightbomber
  run: =>
    map = new Map
    map.generate()

    (new MapView(map)).update()

    @keyboard = new Keyboard
    @keyboard.activate()

    @player = new Player(map) # controller
    @bomb = new Bomb(map)
    @player2 = new Player(map) # controller

    gameLoop = new GameLoop(@tick)
    gameLoop.run()

  tick: (timeDelta) =>
    @player.moving = false
    for direction in ['right', 'up', 'left', 'down']
      if @keyboard.keys[direction]
        @player.moving = true
        @player.direction = direction

    @player.move(timeDelta)

    @player2.moving = false
    for key, direction of {d: 'right', w: 'up', a: 'left', s: 'down'}
      if @keyboard.keys[key]
        @player2.moving = true
        @player2.direction = direction

    @player2.move(timeDelta)
