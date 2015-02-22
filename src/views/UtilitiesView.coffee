class window.UtilitiesView extends Backbone.View

  tagName: 'section'
  className: 'utilities'

  template: _.template "
    <span>Wins: </span><%= this.model.get('wins') %> <br>
    <span>Losses: </span><%= this.model.get('losses')%><br>
    <span>Ties: </span><%= this.model.get('ties')%>
  "
  initialize: =>
    @render()
    @model.on 'change', @render

  render: =>
    @$el.children().detach()
    @$el.html @template()
    