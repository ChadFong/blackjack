class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'busted', false
    @get('playerHand').on 'bust', => @set 'busted', true


  # reset: ->
  #   @get 'deck', deck = new Deck()
  #   @get 'playerHand', deck.dealPlayer()
  #   @get 'dealerHand', deck.dealDealer()

