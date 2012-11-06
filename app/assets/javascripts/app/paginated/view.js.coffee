App.PaginatedView = Backbone.View.extend
  initialize: (options) ->
    _.bindAll this
    typeof (options) isnt "undefined" or (options = {})

    # View
    @initializeView() unless @initializeView is undefined

    # Variables
    @collection = options.collection  if options.collection
    @modelView = options.modelView  if options.modelView
    @loading = options.loading  if options.loading
    @loading = @$el.find(".loading") unless @loading

    # Collection
    @collection.bind "reset", @update
    @collection.fetchPage()


  addOne: (item) ->
    view = new @modelView model: item
    this.$el.find('.list').append view.render()


  update: ->
    # Hide de loading
    @loading.children().hide()

    unless @collection.isEmpty()
      # Add the items
      @collection.each @addOne, @
    else
      # Call renderEmpty if have no item
      (@$el.find('.list').html @renderEmpty() if @collection.page is 1) unless @renderEmpty is undefined

    # Call the waypont to loading
    @loading.waypoint(@waypoint, {offset: "100%"})


  waypoint: (event, direction) ->
    unless @loading.children().is(":visible")
      @loading.waypoint "remove"
      @nextPage() if direction is "down"


  nextPage: ->
    unless @collection.isEmpty()
      @loading.children().show()
      @collection.nextPage()
