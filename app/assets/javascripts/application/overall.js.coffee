$ ->
  console.log "Loaded overall.js.coffee"

  # Change user locale
  # $('#change_locale').bind 'click', ->
  #   new_locale = switch $(@).text()
  #                  when 'en' then 'ru'
  #                  when 'ru' then 'en'
  #                  else 'en'

  #   $.cookie('locale', new_locale, { expires: 365 })
  #   window.location.reload()


  $(".award-icon-item img").live 'mouseenter', ->
    data_title = $(@).attr("data-title")
    data_resume = $(@).attr("data-resume")
    div_append = """
                 <div class='icon-info-wrapper radius'>
                   <span class='arrow'></span>
                     <strong>#{data_title}</strong>
                     <p>#{data_resume}</p>
                 </div>
                """
    $(@).parents(".award-icon-item:first").append(div_append)

  $(".award-icon-item img").live 'mouseleave', ->
    $(this).parents(".award-icon-item:first").find(".icon-info-wrapper").remove()


  $(".partner-item").live 'mouseenter', ->
    data_title = $(@).find("img").attr("data-title")
    data_resume = $(@).find("img").attr("data-resume")  
    div_append = """
                 <div class='partner-info-wrapper radius-10'>
                   <span class='arrow'></span>
                   <strong>#{data_title}</strong>
                   <p>#{data_resume}</p>
                 </div>
                 """
    $(@).append(div_append)

  $(".partner-item").live 'mouseleave', ->
    $(@).find(".partner-info-wrapper").remove()

  $(".series-thumb a[rel^='prettyPhoto']").prettyPhoto
    animation_speed: "normal"
    theme: "facebook"
    slideshow: 10000
    hideflash: true