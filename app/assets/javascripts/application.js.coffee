#= require jquery
#= require jquery_ujs
#= require ckeditor/init
#= require twitter/bootstrap

$ ->

	
	refresh_comments = (new_content) ->
		$(".comentarios").html new_content
		do comment_interaction


	comment_interaction = ->
		$(".simple_form.comentario").submit ->
			submit = $(this).find("input[type='submit']")
			submit.attr "disabled", "disabled"
			submit.val "Enviando…"

			$.post $(this).attr("action"), $(this).serialize(), (response) ->
				do refresh_comments response
				$("#comentario_conteudo").val("")
				submit.removeAttr "disabled"
				submit.val "Enviar"

			false

		$(".remover-comentario").click ->
			if confirm "Quer realmente apagar este comentário?"
				$.post $(this).attr("href"), 
					_method: "delete"
				, (response) ->
					do refresh_comments response
			false
	
	do comment_interaction