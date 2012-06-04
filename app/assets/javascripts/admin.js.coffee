#= require jquery
#= require jquery_ujs
#= require bootstrap
#
#= require json2
#= require hamlcoffee
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route
#= require admin/index

jQuery ->
  $('a[data-remote="true"]').on "ajax:error", (xhr, status, error) ->
    console.log(xhr) #.append xhr.responseText

  $('a[data-remote="true"]').on "ajax:success", (data, status, xhr) ->
    console.log(xhr) #.append xhr.responseText
