class window.AppView extends Backbone.View

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    $('body').append new GameView(model: @model.get 'game').el

