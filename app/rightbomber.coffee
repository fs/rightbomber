class Rightbomber
  constructor: ->
    console.log 'init'
  run: =>
    console.log 'run'

$ -> (new Rightbomber).run
