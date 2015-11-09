# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

update_audio = undefined
update_audio = ->
  audioDiv = undefined
  audioDiv = undefined
  audioDiv = $("#audio")
  if audioDiv.size() > 0
    $.ajax(url: "dashboard/get_audio").done (data) ->
      #alert data.audio_lock
      left_number = 60 + Math.floor((Math.random() * 40) + 1);
      percent = left_number+"%"
      $("#left-audio").css( "width", percent )
      
      right_number = 60 + Math.floor((Math.random() * 40) + 1);
      percent = right_number+"%"
      $("#right-audio").css( "width", percent )
      
      return

  return

ready = ->
  setInterval update_audio, 300

ready()
