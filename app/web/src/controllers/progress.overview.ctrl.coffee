angular.module('CAPmodule')
.controller 'ProgressOverviewCtrl', (progressService) ->
  self = @
  @complete = {}
  numbersToRequest = [
    'percentScanned' ]

  getNumbers = ->
    for num in numbersToRequest
      progressService.getNumber(num)
        .then (res) ->
          self.complete[res.name] = parseInt(res.total)

  setInterval ->
    getNumbers()
  , 60000

  getNumbers()

  return
