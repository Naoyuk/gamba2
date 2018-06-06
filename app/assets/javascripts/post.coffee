# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# 種別で"ルート"を選択した時の岩場のセレクトの絞込み処理
$(document).on 'change', '#style_0', ->
  if $(this).val() == ""
    $('#post_region_box').hide(500)
    $('#post_crag_box').hide(500)
    $('#post_area_box').hide(500)
    $('#post_route_box').hide(500)
  else
    if $('#region_id').val() != ""
      $.ajax(
        type: 'GET'
        url: '/posts/crags_select'
        data: {
          style: 0
          region_id: $("#region_id").val()
        }
      ).done (data) ->
        $('#post_crag_id').html(data)
        $('#post_area_id').val("")
        $('#post_route_id').val("")
      $('#post_crag_box').show(500)
      $('#post_area_box').hide(500)
      $('#post_route_box').hide(500)
    else
      $('#post_region_box').show(500)
      $('#post_crag_box').hide(500)
      $('#post_area_box').hide(500)
      $('#post_route_box').hide(500)

# 種別で"ボルダー"を選択した時の岩場のセレクトの絞込み処理
$(document).on 'change', '#style_1', ->
  if $(this).val() == ""
    $('#post_region_box').hide(500)
    $('#post_crag_box').hide(500)
    $('#post_area_box').hide(500)
    $('#post_route_box').hide(500)
  else
    if $('#region_id').val() != ""
      $.ajax(
        type: 'GET'
        url: '/posts/crags_select'
        data: {
          style: 1
          region_id: $("#region_id").val()
        }
      ).done (data) ->
        $('#post_crag_id').html(data)
        $('#post_area_id').val("")
        $('#post_route_id').val("")
      $('#post_crag_box').show(500)
      $('#post_area_box').hide(500)
      $('#post_route_box').hide(500)
    else
      $('#post_region_box').show(500)
      $('#post_crag_box').hide(500)
      $('#post_area_box').hide(500)
      $('#post_route_box').hide(500)

# 種別で"トラッド"を選択した時の岩場のセレクトの絞込み処理
$(document).on 'change', '#style_2', ->
  if $(this).val() == ""
    $('#post_region_box').hide(500)
    $('#post_crag_box').hide(500)
    $('#post_area_box').hide(500)
    $('#post_route_box').hide(500)
  else
    if $('#region_id').val() != ""
      $.ajax(
        type: 'GET'
        url: '/posts/crags_select'
        data: {
          style: 2
          region_id: $("#region_id").val()
        }
      ).done (data) ->
        $('#post_crag_id').html(data)
        $('#post_area_id').val("")
        $('#post_route_id').val("")
      $('#post_crag_box').show(500)
      $('#post_area_box').hide(500)
      $('#post_route_box').hide(500)
    else
      $('#post_region_box').show(500)
      $('#post_crag_box').hide(500)
      $('#post_area_box').hide(500)
      $('#post_route_box').hide(500)

# 種別で"マルチピッチ"を選択した時の岩場のセレクトの絞込み処理
$(document).on 'change', '#style_3', ->
  if $(this).val() == ""
    $('#post_region_box').hide(500)
    $('#post_crag_box').hide(500)
    $('#post_area_box').hide(500)
    $('#post_route_box').hide(500)
  else
    if $('#region_id').val() != ""
      $.ajax(
        type: 'GET'
        url: '/posts/crags_select'
        data: {
          style: 3
          region_id: $("#region_id").val()
        }
      ).done (data) ->
        $('#post_crag_id').html(data)
        $('#post_area_id').val("")
        $('#post_route_id').val("")
      $('#post_crag_box').show(500)
      $('#post_area_box').hide(500)
      $('#post_route_box').hide(500)
    else
      $('#post_region_box').show(500)
      $('#post_crag_box').hide(500)
      $('#post_area_box').hide(500)
      $('#post_route_box').hide(500)

# 地方を選択した時の種別の表示/非表示
$(document).on 'change', '#region_id', ->
  if $(this).val() == ""
    $('#post_crag_box').hide(500)
    $('#post_area_box').hide(500)
    $('#post_route_box').hide(500)
    $("#style_0").attr("checked", false)
    $("#style_1").attr("checked", false)
  else
    $(document).on 'change', '#region_id', $ ->
      radi = $("input[name='style']:checked").val()
      val_style = if radi == '1' then 1 else 0

      $.ajax(
        type: 'GET'
        url: '/posts/crags_select'
        data: {
          style: val_style
          region_id: $("#region_id").val()
        }
      ).done (data) ->
        $('#post_crag_id').html(data)
        $('#post_area_id').val("")
        $('#post_route_id').val("")
    $('#post_crag_box').show(500)
    $('#post_area_box').hide(500)
    $('#post_route_box').hide(500)

# 岩場を選択した時のエリアのセレクトの絞込み処理
$(document).on 'change', '#post_crag_id', ->
  if $(this).val() == ""
    $('#post_area_box').hide(500)
    $('#post_route_box').hide(500)
  else
    $(document).on 'change', '#post_crag', $ ->
      $.ajax(
        type: 'GET'
        url: '/posts/areas_select'
        data: {
          crag_id: $("#post_crag_id").val()
        }
      ).done (data) ->
        $('#areas_select').html(data)
        $('#post_area_id').val("")
        $('#post_route_id').val("")
    $('#post_area_box').show(500)
    $('#post_route_box').hide(500)

# エリアを選択した時のルートのセレクトの絞込み処理
$(document).on 'change', '#post_area_id', ->
  if $(this).val() == ""
    $('#post_route_box').hide(500)
  else
    $(document).on 'change', '#areas_select', $ ->
      $.ajax(
        type: 'GET'
        url: '/posts/routes_select'
        data: {
          area_id: $("#post_area_id").val()
        }
      ).done (data) ->
        $('#routes_select').html(data)
        $('#post_route_id').val("")
    $('#post_route_box').show(500)
