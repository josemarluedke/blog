App = window.App =
  Common:
    initPage: ->
      unless window.Turbolinks is undefined
        $(document).bind "page:fetch", ->
          $('#loading').show()

        $(document).bind "page:restore", ->
          $('#loading').hide()

        $(document).bind "page:change", ->
          $(window).scrollTop(0)

          try
              FB.XFBML.parse()
          try
              twttr.widgets.load()

    init: ->
      # Something here. This is called in every page, with or without Turbolinks.
    finish: ->
      # Something here. This is called in every page, with or without Turbolinks.
  Collections: {}
  Models: {}
  Posts: {}
