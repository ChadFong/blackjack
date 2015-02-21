class window.GameView extends Backbone.View
      # <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><button class="reset-button">Try Again?</button>
  template: _.template '
    <section class="game">
      <div class="player-hand-container"></div>
      <div class="dealer-hand-container"></div>
    </section>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .reset-button': -> console.log('Reset!')

  initialize: ->
    @render()

  render: ->
    # console.log("GameView's this: " @)
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

