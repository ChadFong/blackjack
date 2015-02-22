class window.UtilitiesView extends Backbone.View

  tagName: 'section'
  className: 'utilities'

  template: _.template "
    <span>Wins: </span><%= this.model.get('wins') %> <br>
    <span>Losses: </span><%= this.model.get('losses')%><br>
    <span>Ties: </span><%= this.model.get('ties')%>
    <br>
    <span class='result'></span> <%= this.resetButton %>
  "
  message: ''

  resetButton: ''

  initialize: =>
    @render()
    @model.on 'change', @render
    @model.get('game').on 'win loss tie', @gameOver, @
    @model.get('game').on 'win', =>
      @message = "You Win!"
      @resetButton = "<button class='reset-button'>Play Again?</button>"
      @render()
    @model.get('game').on 'loss', =>
      @message = "You lost"
      @resetButton = "<button class='reset-button'>Try Again?</button>"
      @render()
    @model.get('game').on 'tie', =>
      @message = "Tie!"
      @resetButton = "<button class='reset-button'>Try Again?</button>"
      @render()

  gameOver: (event) =>
    switch event
      when 'win' then @message = "You Win!" ; @resetButton = "<button class='reset-button'>Play Again?</button>"
      when 'loss' then @message = "You lost" ; @resetButton = "<button class='reset-button'>Try Again?</button>"
      when 'tie' then @message = "Tie!" ; @resetButton = "<button class='reset-button'>Try Again?</button>"
    @render()

  render: =>
    @$el.children().detach()
    @$el.html @template()
    @$('.result').text(@message)
    