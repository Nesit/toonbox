get_coords = ->
  return [55.75578, 37.615149] unless $("#contact_info_coords").val()
  coords = $("#contact_info_coords").val().split(',')
  if coords[0] == 0 || coords[1] == 0
    return [55.75578, 37.615149]
  else
    return [coords[0], coords[1]]

set_coords =(coords) ->
    $("#contact_info_coords").val(coords)

$ ->
  return if $("body.new.admin_contact_infos, body.edit.admin_contact_infos").length == 0
  console.log "Loaded admin/contact_infos.js.coffee"

  console.log get_coords()

  if $('#contact_info_coords').val()
    $('#decode_address').remove()
    $('#show_address').remove()

  init = ->
    window.myMap = new ymaps.Map('edit_map',
      center: get_coords()
      zoom: 17
      behaviors: [ "default", "scrollZoom" ]
    ,
      maxZoom: 15
      minZoom: 15
    )
    myCollection = new ymaps.GeoObjectCollection()

    if $("#contact_info_coords").val()
      coords = get_coords()
      myPlacemark = new ymaps.Placemark(coords,
        hintContent: 'Подвинь меня!'
      ,
        iconImageHref: "/assets/mark.png"
        draggable: true
        iconImageSize: [79, 80]
        iconImageOffset: [0.4, -39.1]
      )

      myMap.setCenter(coords, 15)
      myMap.geoObjects.add(myPlacemark)

      myPlacemark.events.add "dragend", (event) ->
        set_coords(myPlacemark.geometry.getCoordinates())

    $('#show_address').bind 'click', ->
      address = $('#decode_address').val()

      ymaps.geocode(address, results: 1).then (res) ->
        geoObject = res.geoObjects.get(0)
        coords = geoObject.geometry.getCoordinates()
        set_coords(coords)

        myCollection.removeAll()
        myCollection = res.geoObjects

        myPlacemark = new ymaps.Placemark(coords,
          hintContent: 'Подвинь меня!'
        ,
          iconImageHref: "/assets/mark.png"
          draggable: true
          iconImageSize: [79, 80]
        )

        myMap.setCenter(coords, 15)
        myMap.geoObjects.add(myPlacemark)

        myPlacemark.events.add "dragend", (event) ->
          console.log "Coords: #{myPlacemark.geometry.getCoordinates()}"
          set_coords(myPlacemark.geometry.getCoordinates())

      $('#decode_address').remove()
      $('#show_address').remove()
     
      false

  ymaps.ready init

