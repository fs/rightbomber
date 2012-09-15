class GameLoop
  constructor: (@loopFunction) ->
    @lastRunTime = @time()

  run: =>
    time = @time()
    delta = time - @lastRunTime
    @lastRunTime = time

    @loopFunction(delta / 1000.0) # seconds

    setTimeout @run, 1

  time: -> (new Date).getTime()
