#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require editable
#= require droppable

$ ->
    $("[data-editable]").each ->
        new Editable
            path: ""
            element: $(this)

    activate_droppable = ->
        $("[data-droppable]").each ->
            new Droppable
                element: $(this)
                upload_url: "/files"
                callback_upload: ->
                    $.get "/", (response) ->
                        $(".products").html response
                        activate_droppable()

    activate_droppable()