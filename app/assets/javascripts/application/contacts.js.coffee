get_coords = ->
  coords = $('#map').data('coords').split(',')
  [coords[0], coords[1]]

$ ->
  return if $("body.show.contacts").length == 0
  console.log "Loaded application/contacts.js.coffee"

  init = ->
    window.myMap = new ymaps.Map('map',
      center: get_coords()
      zoom: 15
      behaviors: [ "default", "scrollZoom" ]
    ,
      maxZoom: 15
      minZoom: 15
    )

    myPlacemark = new ymaps.Placemark(get_coords(),
      hintContent: 'Toonbox'
    ,
      iconImageHref: "/assets/mark.png"
      draggable: false
      iconImageSize: [79, 80]
      iconImageOffset: [0.4, -39.1]
    )

    myMap.geoObjects.add(myPlacemark)

  ymaps.ready init