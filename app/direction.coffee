###
  
  Directions are measured in floats
  Directions are clockwise
  1 direction unit  == 90 degrees
  2 direction units == PI radian

     3|
  ____|___0
  2   |
      |1

###

class Direction
  constructor: (@angle = 0) ->

  save: -> @savedAngle = @angle; @
  restore: -> @angle = @savedAngle; @

  dx: (distance) -> distance * Math.cos(@angle * Math.PI / 2)
  dy: (distance) -> distance * Math.sin(@angle * Math.PI / 2)

  right: -> @angle = 0; @
  down: -> @angle = 1; @
  left: -> @angle = 2; @
  up: -> @angle = 3; @

  random: -> @angle = Math.random() * 4 % 4; @
  rotateLeft: -> @angle = (@angle + 3) % 4; @
  rotateRight: -> @angle = (@angle + 1) % 4; @
