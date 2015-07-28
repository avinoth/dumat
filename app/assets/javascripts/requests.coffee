$ ->
  $('.upvote-btn').click (e) ->
    e.preventDefault()
    current_path = window.location.pathname
    url = $(this).attr('href')
    allowed = $(this).data('allow')

    if allowed
      $.get url
