#= require jquery
#= require jquery_ujs
#= require google_analytics
#= require autogrow


$ -> 
	
	setTimeout ->
		$(".from").removeClass "from"
	, 1000

	generate_bg_element = (depth) ->
		bg_element = $('<img src="/assets/pilula-hiperativo.svg" class="bg"/>')
		bg_element.appendTo(".wrapper").css
			# opacity: (1-depth)*0.4
			width: "#{20+100*depth}px"
			top: "#{Math.random()*100}%"
			"animation": "bg #{30+(depth*40)}s linear 0 infinite"
		console.log depth

	seeds = [1..7]

	for x in seeds
		generate_bg_element x/10

	change_page = (page, context) ->
		context ?= "body"
		$(context).attr "data-page", page
		window.location.hash = page
		$("[data-link]").removeClass(".active")
		$("[data-link=#{page}]").addClass(".active")

	reset_page = ->
		$("body").removeAttr "data-page"
		window.location.hash = ""

	unless window.location.hash == ""
		page_hash = window.location.hash.split("#")[1]
		change_page page_hash

	$("[data-link]").click ->
		new_page = $(this).attr "data-link"
		if new_page is "reset" then do reset_page else change_page new_page
		false

	$(".thumbnails li a").click ->
		$(this).parent().parent().removeClass "span12"
		.addClass "span2"
		alert "lol"

	$(".formulario-de-contato input")
		.keyup ->
			console.log $(this).val()
			if $(this).val() isnt ""
				$(this).css
					borderBottom: "none"
			else 
				$(this).css
					borderBottom: "1px solid black"

	.autoGrowInput
	    comfortZone: 0
	    minWidth: 20
	    maxWidth: 200













