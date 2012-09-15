class Rightbomber
  keyMap:
    d: 'right'
    w: 'up'
    a: 'left'
    s: 'down'


  run: =>
    map = new Map(30, 20)
    map.generate()

    (new MapView(map)).update()

    @keyboard = new Keyboard

    @player = new Player(map) # controller
    @player2 = new Player(map) # controller

    @bombs = []

    gameLoop = new GameLoop(@tick)
    gameLoop.run()

  tick: (timeDelta) =>
    if @keyboard.isKeyPressed('/')
      bomb = @player.getBomb()
      if bomb.square.isMovable
        @bombs.push(bomb)

    key = @keyboard.latestOf(['right', 'up', 'left', 'down'])
    if (@player.moving = !!key)
      @player.direction = key
    @player.olderBy(timeDelta)

    key = @keyboard.latestOf(['d', 'w', 's', 'a'])
    if (@player2.moving = !!key)
      @player2.direction = @keyMap[key]
    @player2.olderBy(timeDelta)

    bomb.olderBy(timeDelta) for bomb in @bombs
