$ ->
  flashCallback = ->
    $(".flash").fadeOut()
  $(".flash").bind 'click', (ev) =>
    $(".flash").fadeOut()
  setTimeout flashCallback, 20000