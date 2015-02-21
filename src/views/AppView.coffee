class window.AppView extends Backbone.View
  template: _.template '
  <div class="app">
  </div>
  '
  ###
    <section class ="game">
      <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
      <div class="player-hand-container"></div>
      <div class="dealer-hand-container"></div>
    </section>
  ###

  # events:
  #   'click .hit-button': -> @model.get('playerHand').hit()
  #   'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @render()

  render: ->
    # This is creating an extra empty div.  I'm not sure exactly how
    # But it is worth a re-visit.
    @$el.children().detach()
    @$el.html @template()
    @$('.app').html new GameView(model: @model.get 'game').el

