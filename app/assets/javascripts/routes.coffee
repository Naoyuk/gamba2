$ ->
  do ->
    replaceSelectOptions = ($select, results) ->
      $select.html $('<option>')
      $.each results, ->
        option = $('<option>').val(this.id).text(this.name)
        $select.append(option)

    replaceRouteOptions = ->
      routesPath = $(@).find('option:selected').data().routesPath
      $selectRoutes = $(@).closest('form').find('.select-route')
      if routesPath?
        $.ajax
          url: routesPath
          dataType: "json"
          success: (results) ->
            replaceSelectOptions($selectRoutes, results)
          error: (XMLHttpRequest, textStatus, errorThrown) ->
            console.error("Error occurred in replaceRouteOptions")
            console.log("XMLHttpRequest: #{XMLHttpRequest.status}")
            console.log("textStatus: #{textStatus}")
            console.log("errorThrown: #{errorThrown}")
      else
        replaceSelectOptions($selectRoutes, [])

    $('.select-area').on
      'change': replaceRouteOptions
