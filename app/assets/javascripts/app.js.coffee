App = window.App =
  initPage: ->
    unless window.Turbolinks is undefined
      that = this
      $(document).bind "page:fetch", ->
        that.Loading.show()

      $(document).bind "page:restore", ->
        that.Loading.hide()

      $(document).bind "page:change", ->
        $(window).scrollTop(0)

        try
            FB.XFBML.parse()
        try
            twttr.widgets.load()

  init: ->
    # Something here. This is called in every page, with or without Turbolinks.

  Loading:
    show: ->
      $('#loading #back-overlay, #loading #front-overlay').fadeIn(2)
    hide: ->
      $('#loading #back-overlay, #loading #front-overlay').hide()

  Posts: {}

