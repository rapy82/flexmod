# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#update_selected_mode_image = ->
#  selected = undefined
#  selected_image = undefined
#  selected = $("#mode_configuration_mode_configuration").val()
#  selected_image = "/assets/mode_images/mode_" + selected + ".jpg"
#  $("#selected-mode-image").attr "src", selected_image
#  return


#ready = ->
#  update_selected_mode_image()
#  $("#mode_configuration_mode_configuration").change ->
#    update_selected_mode_image()
#    return
#  return

#$(document).ready(ready)
#$(document).on('page:load', ready)

update_selected_mode_image = ->
  selected = undefined
  selected_image = undefined
  selected = undefined
  selected_image = undefined
  selected = $("#mode_configuration_mode_configuration").val()
  selected_image = "/assets/mode_images/mode_" + selected + ".jpg"
  $("#selected-mode-image").attr "src", selected_image
  return


update_selected_mode_config = ->
  selected = undefined
  selected = undefined
  selected = $("#mode_configuration_mode_configuration").val()
  selected = parseInt(selected)
  $("#mode_configuration_input_gain").prop "readonly", false
  $("#mode_configuration_ext_sca_gain").prop "readonly", false
  $("#mode_configuration_ext_mpx_gain").prop "readonly", false
  switch selected
    when 1, 2
      $("#mode_configuration_input_gain").prop "readonly", true
      $("#mode_configuration_ext_sca_gain").prop "readonly", true
    when 3, 4, 5, 6
      $("#mode_configuration_input_gain").prop "readonly", true
    when 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18
      $("#mode_configuration_ext_mpx_gain").prop "readonly", true
      $("#mode_configuration_ext_sca_gain").prop "readonly", true
    when 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42
      $("#mode_configuration_input_gain").prop "readonly", true
      $("#mode_configuration_ext_mpx_gain").prop "readonly", true
      $("#mode_configuration_ext_sca_gain").prop "readonly", true

ready = ->
  update_selected_mode_image()
  update_selected_mode_config()
  $("#mode_configuration_mode_configuration").change ->
    update_selected_mode_image()
    update_selected_mode_config()
    return

  return

$(document).ready ready
$(document).on "page:load", ready
