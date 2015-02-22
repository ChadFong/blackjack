window.App = new App()
new UtilitiesView(model: window.App).$el.appendTo 'body'
window.AppView = new AppView(model: window.App)