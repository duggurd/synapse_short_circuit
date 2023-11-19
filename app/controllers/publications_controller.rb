class PublicationsController < ApplicationController
    def index
        @publications = Publication.all
    end

    def show
        @publication = Publication.find_by( name: params[:id] )
        if not @publication.nil? # and not @publication.hidden
            @tags = Tag.where( publication_name: params[:id])

            @description = render_to_string( inline: @publication.description.html_safe)
            @body = render_to_string( inline: @publication.body.html_safe)
            @resources = render_to_string( inline: @publication.resources.html_safe)
        end
        @page_entity = @publication
    end

    private
        def publication_params
            params.require(:publication).permit(:id, :name, :version, :stage, :description, :body, :results, :created_at, :resources, :updated_at, :hidden, :github_link)
        end

        def routing_error
            render :file => Rails.root.join("public", "404.html"), status => 404, :layout => true
        end
    end
