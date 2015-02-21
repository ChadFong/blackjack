class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @set 'busted', false
    @get('playerHand').on 'bust', @dealerPlay
    @get('playerHand').on 'stand', @dealerPlay
  
  dealerPlay: =>
    dHand = @get('dealerHand')
    dHand.at(0).flip()
# TODO  Need to have some way for dealer to choose which score.
    while dHand.scores()[0] < 17
      dHand.hit()


  # reset: ->
  #   @get 'deck', deck = new Deck()
  #   @get 'playerHand', deck.dealPlayer()
  #   @get 'dealerHand', deck.dealDealer()

