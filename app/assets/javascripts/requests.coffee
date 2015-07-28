$ ->
  $('.upvote-btn').click (e) ->
    e.preventDefault()
    el = $(this)
    current_path = window.location.pathname
    url = $(this).attr('href')
    allowed = $(this).data('allow')

    if allowed
      $.ajax(url).done( (xhr, statusText) ->
        $('#upvotes-count').text(xhr.upvotes)
        el.text(xhr.status)
        )
