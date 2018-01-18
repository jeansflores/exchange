$(document).ready ->
  $('#quantity').on 'change', ->
    convert()
        
  $('#exchange_local').click ->
    currency = $('#currency').val()
    currency_destination = $('#currency_destination').val()
    $('#currency').prop('value', currency_destination)
    $('#currency_destination').prop('value', currency)
    convert()

  convert = ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;
        