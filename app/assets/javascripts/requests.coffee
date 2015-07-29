$ ->
  $('.upvote-btn').click (e) ->
    e.preventDefault()
    el = $(this)
    url = $(this).attr('href')
    allowed = $(this).data('allow')

    if allowed
      $.ajax(url).done( (xhr, statusText) ->
        el.parents('.panel-footer').find('.upvotes-count').text(xhr.upvotes)
        el.text(xhr.status)
        )
    else
      $('#login-modal').modal()
