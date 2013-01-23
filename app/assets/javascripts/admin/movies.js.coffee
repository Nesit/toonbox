movie_id =() ->
  regex = /movies\/(\d+)/
  regex.exec(window.location.href)[1]

add_images =() ->
  data = new FormData()
  jQuery.each $("#add_image")[0].files, (i, file) ->
    data.append 'images[]', file

  $.ajax "/admin/movies/#{movie_id()}/add_image",
    type: 'POST'
    data: data
    cache: false
    contentType: false
    processData: false
    complete: (response) ->
      $(".images").append(response.responseText)
      $("#add_image").val('')

set_image_as_default =(id) ->
  $.ajax "/admin/movies/#{movie_id()}/image_as_default",
    type: 'PUT'
    data: { image_id: id}
  
$ ->
  return if $("body.admin_movies").length == 0
  console.log "Loaded admin/movies.js.coffee"

  $("#add_image_button").bind 'click', () ->
    add_images()
    false

  $("input.default_image").live 'click', () ->
    set_image_as_default($(@).parents("div.image").data("image-id"))
