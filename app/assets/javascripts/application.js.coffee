# This is a manifest file that'll be compiled into including all the files listed below.
# Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
# be included in the compiled file accessible from http://example.com/assets/application.js
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
#= require jquery
#= require jquery_ujs
#= require foundation/foundation
#= require foundation/foundation.alerts
#= require foundation/foundation.clearing
#= require foundation/foundation.cookie
#= require foundation/foundation.dropdown
#= require foundation/foundation.forms
#= require foundation/foundation.joyride
#= require foundation/foundation.magellan
#= require foundation/foundation.orbit
#= require foundation/foundation.reveal
#= require foundation/foundation.section
#= require foundation/foundation.tooltips
#= require foundation/foundation.topbar
#= require foundation/foundation.interchange
#= require foundation/foundation.placeholder
#= require foundation/foundation.abide
#= require_tree .

$ ->
  $(document).foundation()
