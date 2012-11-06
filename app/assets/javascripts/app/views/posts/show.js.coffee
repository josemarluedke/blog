App.Posts.Show = Backbone.View.extend
  el: 'body'
  initialize: ->
    $('.post .content a').attr('target','_blank').attr('no-turbolinks', true)
