class window.Game extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'bust', @concludeRound
    @get('playerHand').on 'stand', @concludeRound    

  dealerDraw: =>
    if @get('dealerHand').bestScore() < 17
      @get('dealerHand').hit()
    if @get('dealerHand').bestScore() < 17
      setTimeout(@dealerDraw, 750)
    else
      @determineVictor()

  concludeRound: =>
    @get('dealerHand').first().flip()
    setTimeout(@dealerDraw, 750)

  determineVictor: =>

    pHand = @get('playerHand')
    pScore = pHand.bestScore()
    dHand = @get('dealerHand')
    dScore = dHand.bestScore()

    if pScore > 21
      @trigger 'loss'
    else if dScore > 21
      @trigger 'win'
    else if pScore > dScore
      @trigger 'win'
    else if pScore < dScore
      @trigger 'loss'
    else
      @trigger 'tie'

# TODO  Allow player to toggle between H17 (dealer hit on soft 17) 
  # and S17 (dealer stand on soft 17).  S17 benefits player.

  # reset: ->
  #   @get 'deck', deck = new Deck()
  #   @get 'playerHand', deck.dealPlayer()
  #   @get 'dealerHand', deck.dealDealer()

