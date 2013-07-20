# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require jquery.pjax
#= require jquery.ui.datepicker
#= require foundation/foundation
#= require foundation/foundation.alerts
#= require foundation/foundation.dropdown
#= require foundation/foundation.tooltips
#= require foundation/foundation.topbar
#= require utils
#= require_self
#= require_tree .

$ = jQuery
$.extend
  on_pjax_load: (callback) ->
    past_href = null
    $ ->
      callback()
      past_href = location.href
      $(document).on 'pjax:popstate', (e) ->
        setTimeout(
          ->
            if typeof past_href != 'undefined' && past_href == location.href
              callback()
          , 50
        )
      $(document).on 'pjax:end', (e) ->
        callback()

$.on_pjax_load ->
  unless Modernizr.inputtypes.date
    $('input.date.hasDatepicker').removeClass('hasDatepicker')
    $('input.date').datepicker
      dateFormat: 'yy/mm/dd'

$ ->
  $(document).foundation()

  # Triggers of PJAX
  $(document).pjax('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])', '[data-pjax-container]')

  # After PJAX requests, we can operate callbacks as we like.
  on_pjax_reload = ->
    $('.top-bar.expanded').removeClass('expanded')

  $(document).on('ready pjax:end', on_pjax_reload)
