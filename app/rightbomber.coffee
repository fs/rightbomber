class Rightbomber
  keyMap:
    d: 'right'
    w: 'up'
    a: 'left'
    s: 'down'

  run: =>
    @map = new Map
    @map.generate()

    (new MapView(@map)).update()

    @keyboard = new Keyboard

    @player = new Player(@map)

    @player2 = new Player(@map)
    @player2.moveBy(2, 2)
    @player2.update()

    gameLoop = new GameLoop(@tick)
    gameLoop.run()

  tick: (timeDelta) =>
    if @keyboard.isKeyPressed('/')
      @player.plantBomb()

    direction = @keyboard.latestOf(['right', 'up', 'left', 'down'])
    if (@player.moving = !!direction)
      @player.face(direction)

    direction = @keyMap[@keyboard.latestOf(['d', 'w', 's', 'a'])]
    if (@player2.moving = !!direction)
      @player2.face(direction)

    for object in @map.objects
      object.olderBy(timeDelta)
