class GameLoop
  constructor: (@loopFunction) ->
    @lastRunTime = @time()
  run: =>
    time = @time()
    delta = time - @lastRunTime
    @lastRunTime = time

    @loopFunction(delta)

    setTimeout @run, 0
  time: -> (new Date).getTime()
