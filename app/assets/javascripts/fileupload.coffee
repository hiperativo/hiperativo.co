class FileUpload
    constructor: (options) ->
        for k,v of options then @[k] = v
        @load_preview()

    load_preview: ->
        reader = new FileReader
        reader.readAsDataURL @file
        reader.onload = (e) =>
            @element = $([
                "<div>",
                    "<img src=\"#{reader.result}\"/>"
                "</div>"
            ].join()).appendTo(@wrapper)

            @send()

    send: ->
        fd = new FormData
        fd.append "file", @file, @file.name
        fd.append "id", @id
        request = $.ajax
            url: @url
            data: fd
            processData: false
            contentType: false
            type: "POST"

        @change_state "progress"
        request.success =>
            @wrapper.append "<p>done</p>"
            @change_state "success"
            @callback_upload.call() if @callback_upload?

    change_state: (status) -> @element.attr "data-state", status

@FileUpload = FileUpload