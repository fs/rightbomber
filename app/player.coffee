class Player
  velocity: 4 # grid element per second

  position:
    x: 0
    y: 0

  moving: false
  direction: 1

  directionMap:
    0: 'right'  # 0
    1: 'up'     # 1 * pi/2
    2: 'left'   # 2 * pi/2
    3: 'down'   # 3 * pi/2
    'right': 0
    'up'   : 1
    'left' : 2
    'down' : 3

  constructor: () -> # @renderer = new PlayerRenderer

  setDirection: (directionString) =>
    @direction = @directionMap[directionString]

  move: (timeDelta) =>
    if @moving
      dx = 0
      dy = 0
      velocity = @velocity * timeDelta

      dx =  velocity if @direction == 0
      dx = -velocity if @direction == 2
      dy = -velocity if @direction == 1
      dy =  velocity if @direction == 3

      newPosition = {}
      newPosition.x = @position.x + dx
      newPosition.y = @position.y + dy

      @position = newPosition if @isPassable(newPosition)

  toString: =>
    state = ['player']
    state.push 'moving' if @moving
    state.push @directionMap[@direction]
    state.join ' '
