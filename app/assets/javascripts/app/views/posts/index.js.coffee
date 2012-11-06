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
    tagName: 'section'
    className: 'post-box'
    template: (data)->
      _.template($('#post_template').html(), data)

    render: ->
      this.$el.html @template(@model.toJSON())

