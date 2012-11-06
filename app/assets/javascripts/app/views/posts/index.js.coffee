App.Posts.Index = App.PaginatedView.extend
  el: "#posts-list"


  initializeView: ->
    category = $('.filter-category').html()
    if category == ""
      @collection = new App.Collections.Posts()
    else
      @collection = new App.Collections.Posts(url: category)
  renderEmpty: ->

  modelView: Backbone.View.extend
    tagName: 'li'
    template: _.template('<h3><%= title %></h3> <p><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/></p>')

    render: ->
      this.$el.html @template(@model.toJSON())

