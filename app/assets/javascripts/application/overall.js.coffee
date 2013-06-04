window.Share =
  vkontakte: (purl, ptitle, pimg, text) ->
    url = "http://vkontakte.ru/share.php?"
    url += "url=" + encodeURIComponent(purl)
    url += "&title=" + encodeURIComponent(ptitle)
    url += "&description=" + encodeURIComponent(text)
    url += "&image=" + encodeURIComponent(pimg)
    url += "&noparse=true"
    Share.popup url

  odnoklassniki: (purl, text) ->
    url = "http://www.odnoklassniki.ru/dk?st.cmd=addShare&st.s=1"
    url += "&st.comments=" + encodeURIComponent(text)
    url += "&st._surl=" + encodeURIComponent(purl)
    Share.popup url

  facebook: (purl, ptitle, pimg, text) ->
    url = "http://www.facebook.com/sharer.php?s=100"
    url += "&p[title]=" + encodeURIComponent(ptitle)
    url += "&p[summary]=" + encodeURIComponent(text)
    url += "&p[url]=" + encodeURIComponent(purl)
    url += "&p[images][0]=" + encodeURIComponent(pimg)
    Share.popup url

  twitter: (purl, ptitle) ->
    url = "http://twitter.com/share?"
    url += "text=" + encodeURIComponent(ptitle)
    url += "&url=" + encodeURIComponent(purl)
    url += "&counturl=" + encodeURIComponent(purl)
    Share.popup url

  mailru: (purl, ptitle, pimg, text) ->
    url = "http://connect.mail.ru/share?"
    url += "url=" + encodeURIComponent(purl)
    url += "&title=" + encodeURIComponent(ptitle)
    url += "&description=" + encodeURIComponent(text)
    url += "&imageurl=" + encodeURIComponent(pimg)
    Share.popup url

  popup: (url) ->
    width  = 740
    height = 440
    left   = ($(window).width()  - width)  / 2
    top    = ($(window).height() - height) / 2
    opts   = "toolbar=0,status=1,width=#{width},height=#{height},top=#{top},left=#{left};"
    window.open url, "", opts

current_head_section =() ->
  $("##{app['head_section']}_head").parent().addClass('current')

current_submenu_section =() ->
  $("##{app['submenu_section']}_submenu").parent().addClass('current')

share_social =(url, service) ->
  width  = 740
  height = 440
  left   = ($(window).width()  - width)  / 2
  top    = ($(window).height() - height) / 2
  opts   = "toolbar=0,status=1,width=#{width},height=#{height},top=#{top},left=#{left};"

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

  $('a.share').on 'click', ->
    share_social($(@).attr('href'), $(@).data('service'))
    false

  # Change user locale
  $('div.lang a.change_language').bind 'click', ->
    $.cookie('locale', $(@).data('language'))
    window.location.reload()


  $(".award-icon-item img").on 'mouseenter', ->
    data_resume = $(@).attr("data-resume")
    div_append = """
                 <div class='icon-info-wrapper radius'>
                   <span class='arrow'></span>
                     <p>#{data_resume}</p>
                 </div>
                """
    $(@).parents(".award-icon-item:first").append(div_append)

  $(".award-icon-item img").on 'mouseleave', ->
    $(this).parents(".award-icon-item:first").find(".icon-info-wrapper").remove()


  $(".partner-item").on 'mouseenter', ->
    data_resume = $(@).find("img").attr("data-resume")
    div_append = """
                 <div class='partner-info-wrapper radius-10'>
                   <span class='arrow'></span>
                   <p>#{data_resume}</p>
                 </div>
                 """
    $(@).append(div_append)
 
  $(".partner-item").on 'mouseleave', -> 
    $(@).find(".partner-info-wrapper").remove()

  $(".series-thumb a[rel^='prettyPhoto']").prettyPhoto
    animation_speed: "normal"
    theme: "facebook"
    slideshow: 10000
    default_width: 640
    default_height: 360
    hideflash: true
    changepicturecallback: (holder) ->
      #hack: remove visibility style
      holder.find('.video_by_code embed').attr('style', '')
      holder.find('.video_by_code object').attr('style', '')
