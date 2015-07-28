# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.login-btn').click (e) ->
    e.preventDefault()
    current_path = window.location.pathname
    url = $(this).data('href') + '?redirect_uri=' + current_path

    window.location = url
