App.PaginatedCollection = Backbone.Collection.extend
  initialize: (options) ->
    typeof (options) isnt "undefined" or (options = {})
    @url = options.url  if options.url
    @search = options.search  if options.search
    @initializePages()

  initializePages: ->
    _.bindAll this, "nextPage"
    @page = 1

  fetchPage: ->
    @fetch data:
      page: @page
      search: @search if @search

  nextPage: ->
    @page++
    @fetchPage()
