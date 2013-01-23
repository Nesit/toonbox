object_attr =() ->
  regex = /(\w+)\/(\d+)/
  [regex.exec(window.location.href)[1], regex.exec(window.location.href)[2]]

add_images =() ->
  data = new FormData()
  jQuery.each $("#add_image")[0].files, (i, file) ->
    data.append 'images[]', file

  $.ajax "#{window.url_part}/add_image",
    type: 'POST'
    data: data
    cache: false
    contentType: false
    processData: false
    complete: (response) ->
      $(".images").append(response.responseText)
      $("#add_image").val('')

set_image_as_default =(id) ->
  $.ajax "#{window.url_part}/image_as_default",
    type: 'PUT'
    data: { image_id: id}
  
$ ->
  return if $("body.edit.admin_movies, body.edit.admin_movie_episodes").length == 0
  console.log "Loaded admin/movies_episodes_images.js.coffee"

  window.url_part = "/admin/#{object_attr()[0]}/#{object_attr()[1]}"

  $('input#add_image').bind 'change', () ->
    if $(@).val()
      add_images()

  $("input.default_image").live 'click', () ->
    set_image_as_default($(@).parents("div.image").data("image-id"))
