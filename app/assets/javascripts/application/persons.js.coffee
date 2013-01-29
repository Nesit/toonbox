unhide_person_block =(link) ->
  for block in $('div.person_block')
    $(block).addClass('hidden') if !$(block).hasClass('hidden')

  for block in $('div.person-list ul li.current')
    $(block).removeClass('current')

  id = $(link).data('person-id')
  $("#person_#{id}").removeClass('hidden') if $("#person_#{id}").hasClass('hidden')
  $(link).parents("li:first").addClass("current") if !$(link).parents("li:first").hasClass("current")

  title = $("#person_#{id}").find('div.name').text()
  $('a.head_name').text(title)
  
select_first_staff =() ->
  link = $('div.person-list').find("ul li:first a")
  unhide_person_block(link)

$ ->
  return if $("body.index.persons").length == 0
  console.log "Loaded application/persons.js.coffee"

  select_first_staff()

  $('a.person').bind 'click', ->
    unhide_person_block(this)
    false