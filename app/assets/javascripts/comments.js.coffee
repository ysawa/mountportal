$.on_pjax_load ->
  $('.comment_link').on 'click', ->
    $el = $(@)
    $el.hide()
    $el.siblings('.comment_fields').show()
