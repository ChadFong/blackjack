class window.AppView extends Backbone.View

  template: _.template "<div class='GameView'></div>"

  initialize: ->
    @render()
    @model.on 'replay', =>
      console.log(@$el)
      @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    $('.GameView').append new GameView(model: @model.get 'game').el

