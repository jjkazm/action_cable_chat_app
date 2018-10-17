App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    unless data.blank?
      $('#messages-table').append data
      scroll_bottom()

$(document).on 'turbolinks:load', ->
  submit_message()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      $('input').click()
      event.target.value = ""
      event.preventDefault()



scroll_bottom = () ->
    $('#messages').scrollTop($('#messages-table')[0].scrollHeight)
