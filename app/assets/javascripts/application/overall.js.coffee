current_head_section =() ->
  $("##{app['head_section']}_head").parent().addClass('current')

current_submenu_section =() ->
  $("##{app['submenu_section']}_submenu").parent().addClass('current')

share_social =(url, service) ->
  width  = 575
  height = 400
  left   = ($(window).width()  - width)  / 2
  top    = ($(window).height() - height) / 2
  opts   = 'status=1,width=#{width},height=#{height},top=#{top},left=#{left};' 

  myWindow = window.open(url, service, opts)
  myWindow.focus()

$.noty.defaults =
  layout: "top"
  theme: 'defaultTheme'
  type: "alert"
  text: ""
  dismissQueue: true # If you want to use queue feature set this true
  template: "<div class=\"noty_message\"><span class=\"noty_text\"></span><div class=\"noty_close\"></div></div>"
  animation:
    open:
      height: "toggle"
    close:
      height: "toggle"
    easing: "swing"
    speed: 500 # opening & closing animation speed

  timeout: 3000 # delay for closing event. Set false for sticky notifications
  force: false # adds notification to the beginning of queue when set to true
  modal: false
  closeWith: ["hover"]
  callback:
    onShow: ->
    afterShow: ->
    onClose: ->
    afterClose: ->

  buttons: false # an array of buttons

window.send_notify =(text, type='alert') ->
  noty(text: text, type: type)

check_default_notice =->
  window.send_notify(app['flash_notice'], 'success') if app['flash_notice'] != ''
  window.send_notify(app['flash_alert'], 'error') if app['flash_alert'] != ''

$ ->
  console.log "Loaded overall.js.coffee"

  check_default_notice()

  current_head_section()
  current_submenu_section()

  $('a.share').live 'click', ->
    share_social($(@).attr('href'), $(@).data('service'))
    false

  # # Change user locale
  # $('div.lang a').bind 'click', ->
  #   new_locale = $(@).data('language')
  #   $.cookie('locale', new_locale, { expires: 365 })
  #   window.location.reload()


  # $(".award-icon-item img").live 'mouseenter', ->
  #   data_title = $(@).attr("data-title")
  #   data_resume = $(@).attr("data-resume")
  #   div_append = """
  #                <div class='icon-info-wrapper radius'>
  #                  <span class='arrow'></span>
  #                    <strong>#{data_title}</strong>
  #                    <p>#{data_resume}</p>
  #                </div>
  #               """
  #   $(@).parents(".award-icon-item:first").append(div_append)

  # $(".award-icon-item img").live 'mouseleave', ->
  #   $(this).parents(".award-icon-item:first").find(".icon-info-wrapper").remove()


  # $(".partner-item").live 'mouseenter', ->
  #   data_title = $(@).find("img").attr("data-title")
  #   data_resume = $(@).find("img").attr("data-resume")  
  #   div_append = """
  #                <div class='partner-info-wrapper radius-10'>
  #                  <span class='arrow'></span>
  #                  <strong>#{data_title}</strong>
  #                  <p>#{data_resume}</p>
  #                </div>
  #                """
  #   $(@).append(div_append)

  # $(".partner-item").live 'mouseleave', ->
  #   $(@).find(".partner-info-wrapper").remove()

  # $(".series-thumb a[rel^='prettyPhoto']").prettyPhoto
  #   animation_speed: "normal"
  #   theme: "facebook"
  #   slideshow: 10000
  #   hideflash: true

