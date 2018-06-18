$ ->
  do ->
    replaceSelectOptions = ($select, results) ->
      $select.html $('<option>')
      $.each results, ->
        option = $('<option>').val(this.id).text(this.name).data("routesPath", "/areas/" + this.id + "/routes")
        $select.append(option)

    replaceAreaOptions = ->
      areasPath = $(@).find('option:selected').data().areasPath
      $selectAreas = $(@).closest('form').find('.select-area')
      if areasPath?
        $.ajax
          url: areasPath
          dataType: "json"
          success: (results) ->
            replaceSelectOptions($selectAreas, results)
          error: (XMLHttpRequest, textStatus, errorThrown) ->
            console.error("Error occurred in replaceAreaOptions")
            console.log("XMLHttpRequest: #{XMLHttpRequest.status}")
            console.log("textStatus: #{textStatus}")
            console.log("errorThrown: #{errorThrown}")
      else
        replaceSelectOptions($selectAreas, [])

    $('.select-crag').on
      'change': replaceAreaOptions
