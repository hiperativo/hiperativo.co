module ApplicationHelper

    def logged_in
        return session[:password] == ENV["PASSWORD"]
    end

    # def m(content)
    #     renderer = Redcarpet::Render::HTML
    #     options = {}
    #     markdown = Redcarpet::Markdown.new renderer, options
    #     markdown.render content
    # end
end