$.fn.centralizar = ->
	metade_da_altura_do_elemento = $(this).outerHeight()/2
	metade_da_altura_da_tela = $(window).height()/2
	obj = $(this)

	$(window).resize ->
		metade_da_altura_da_tela = $(window).height()/2
		obj.css
			marginTop: metade_da_altura_da_tela - metade_da_altura_do_elemento

	do $(window).resize