class window.AppView extends Backbone.View
  template: _.template '<div class="app"></div>'
  

  initialize: ->
    @render()

  render: ->
#TODO This is creating an extra empty div.  I'm not sure exactly how but it is worth a re-visit.
    @$el.children().detach()
    @$el.html @template()
    @$('.app').html new GameView(model: @model.get 'game').el

