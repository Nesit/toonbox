allow_video_in_html_editor =->
  return if typeof(window.AA) == 'undefined'
  iframe =
    check_attributes:
      src: "url"
    set_attributes:
      width: "560"
      height: "315"
      frameborder: "0"
      allowfullscreen: ""
  window.AA.editor_config.parserRules.tags.iframe = iframe
    
  
$ ->
  console.log "Loaded admin/overall.js.coffee"

  allow_video_in_html_editor()
  