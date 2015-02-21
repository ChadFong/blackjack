class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @set 'busted', false
    @get('playerHand').on 'bust', @concludeRound
    @get('playerHand').on 'stand', @concludeRound
  
  concludeRound: =>
  # Calculate dealer's drawing.
    dHand = @get('dealerHand')
    dHand.at(0).flip()
# TODO :Refactor to CoffeeScript
    `function dealerDraw (){
      setTimeout(function(){
        if( dHand.scores()[0] < 17 ){
          dHand.hit()
        }
        if( dHand.scores()[0] < 17 ){
          dealerDraw()
        }
      }, 750)
    }()`

# TODO  Allow player to toggle between H17 (dealer hit on soft 17) 
  # and S17 (dealer stand on soft 17).  S17 benefits player.

  # reset: ->
  #   @get 'deck', deck = new Deck()
  #   @get 'playerHand', deck.dealPlayer()
  #   @get 'dealerHand', deck.dealDealer()

