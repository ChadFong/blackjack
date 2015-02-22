class window.App extends Backbone.Model

  initialize: ->
    @set 'game', game = new Game()

    #UtilitiesView Attributes
    @set 'wins', 0
    @set 'losses', 0
    @set 'ties', 0

    @get('game').on 'loss', =>
      @set('losses', @get('losses') + 1)
    @get('game').on 'win', =>
      @set('wins', @get('wins') + 1)
    @get('game').on 'tie', =>
      @set('ties', @get('ties') + 1)
