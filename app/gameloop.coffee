class GameLoop
  constructor: (@loopFunction) ->
    @lastRunTime = @time()
  run: =>
    time = @time()
    delta = time - @lastRunTime
    @lastRunTime = time

    @loopFunction(delta / 1000.0) # seconds

    # setTimeout @run, 0
    webkitRequestAnimationFrame @run, document.body

  time: -> (new Date).getTime()
