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

    @player = new Player(map)

    @player2 = new Player(map)
    @player2.moveBy(2, 2)
    @player2.update()

    @bombs = []

    gameLoop = new GameLoop(@tick)
    gameLoop.run()

  tick: (timeDelta) =>
    if @keyboard.isKeyPressed('/')
      bomb = @player.plantBomb()
      @bombs.push(bomb) if bomb?

    key = @keyboard.latestOf(['right', 'up', 'left', 'down'])
    if (@player.moving = !!key)
      @player.setDirection(key)
    @player.olderBy(timeDelta)

    key = @keyboard.latestOf(['d', 'w', 's', 'a'])
    if (@player2.moving = !!key)
      @player2.setDirection(@keyMap[key])
    @player2.olderBy(timeDelta)

    bomb.olderBy(timeDelta) for bomb in @bombs
