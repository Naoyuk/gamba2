$ ->
  do ->
    replaceSelectOptions = ($select, results) ->
      $select.html $('<option>')
      $.each results, ->
        option = $('<option>').val(this.id).text(this.name).data("areasPath", "/crags/" + this.id + "/areas")
        $select.append(option)

    replaceCragOptions = ->
      cragsPath = $(@).find('option:selected').data().cragsPath
      $selectCrags = $(@).closest('form').find('.select-crag')
      if cragsPath?
        $.ajax
          url: cragsPath
          dataType: "json"
          success: (results) ->
            replaceSelectOptions($selectCrags, results)
          error: (XMLHttpRequest, textStatus, errorThrown) ->
            console.error("Error occurred in replaceCragsOptions")
            console.log("XMLHttpRequest: #{XMLHttpRequest.status}")
            console.log("textStatus: #{textStatus}")
            console.log("errorThrown: #{errorThrown}")
      else
        replaceSelectOptions($selectCrags, [])

    $('.select-region').on
      'change': replaceCragOptions
