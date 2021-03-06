class window.HandView extends Backbone.View
  className: 'hand'

  playerButtons: "<button class='hit-button'>Hit</button> <button class='stand-button'>Stand</button>"

  template: _.template "<h2>
                          <% if(isDealer){ %>Dealer\'s Score: <span class='score'></span> <%}
                                else{ %>
                                <%= this.playerButtons %><br>
                                Your Score: <span class='score'></span>
                             <% } %>
                        </h2>"

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()
    @collection.on 'bust', =>
      @playerButtons = ""
      @render true
    @collection.on 'stand', =>
      @playerButtons = ""
      @render()

#TODO: Slim down to only the difference being decided by if
  render: (bust) ->
    if bust is undefined
      @$el.children().detach()
      @$el.html @template @collection
      @$el.append @collection.map (card) ->
        new CardView(model: card).$el
      @$('.score').text @collection.bestScore()
    else
      @$el.children().detach()
      @$el.html @template @collection
      @$el.append @collection.map (card) ->
        new CardView(model: card).$el
      @$('.score').text "Busted! (" + @collection.bestScore() + ")"
    
