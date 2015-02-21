# console.log("main's @$el: ", $el)
window.Thing = new AppView(model: new App())
Thing.$el.appendTo 'body'
