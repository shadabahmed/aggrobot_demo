# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$ ->
  $('#runs').click (e)->
    e.preventDefault()
    $.get 'runs.json', (data, status)->
      console.log(data)
      ScoreCharts.plot(data)


  $('#oppositions').click ->
    $.get 'oppositions.json', (data, status)->
      console.log(data)
      ScoreCharts.plot(data)


  $('#results').click ->
    $.get 'results.json', (data, status)->
      console.log(data)
      ScoreCharts.plot(data)
