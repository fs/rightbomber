class GameLoop
  constructor: (@loopFunction) ->
    @lastRunTime = @time()
  run: =>
    time = @time()
    delta = time - @lastRunTime
    @lastRunTime = time

    @loopFunction(delta / 1000.0) # seconds

    window.requestAnimationFrame = window.webkitRequestAnimationFrame ||
      window.mozRequestAnimationFrame ||
      window.oRequestAnimationFrame ||
      window.msRequestAnimationFrame ||
      (callback, element) -> window.setTimeout(callback, 0)

    requestAnimationFrame @run, document.body

  time: -> (new Date).getTime()
