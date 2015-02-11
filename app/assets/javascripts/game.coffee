# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	$("#showAnswers").on "click", (event) ->
		console.log("clicked")
		$("div[name='answer']").toggle("hidden")
		event.preventDefault()


# turbolinks creates this issue http://stackoverflow.com/questions/20252530/coffeescript-jquery-on-click-only-working-when-page-is-refreshed
$(document).ready(ready)
$(document).on('page:load', ready)