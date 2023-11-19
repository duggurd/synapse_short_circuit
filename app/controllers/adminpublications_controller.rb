class AdminpublicationsController < ApplicationController
    def index
        @publications = Publication.all
    end

    def show
        @publication = Publication.find_by( name: params[:id] )
        if not @publication.nil?
            @tags = Tag.where( publication_name: params[:id])

            @description = render_to_string( inline: @publication.description.html_safe)
            @body = render_to_string( inline: @publication.body.html_safe)
            @resources = render_to_string( inline: @publication.resources.html_safe)
        end
        @page_entity = @publication
    end

    def new
        @publication = Publication.new
    end

    def create
        @publication = Publication.new(publication_params)

        if @publication.save
            redirect_to adminpub_path(@publication.name)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @publication = Publication.find_by( name: params[:id] )
    end

    def update
        @publication = Publication.find_by( name: params[:id] )
        @tags = Tag.find_by( project_name: @publication.name) 
        
        if @publication.update( publication_params )
            redirect_to adminpub_path( @publication.name )
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @publication = Publication.find_by( name: params[:publication_name] )
        @tags = Tag.find_by( project_name: params[:publication_name] )
        if @tags
            @tags.destroy
        end
        @publication.destroy

        redirect_to admin_index_path, status: :see_other
    end

    private
        def publication_params
            params.require(:publication).permit(:id, :name, :stage, :description, :body, :resources, :created_at, :updated_at, :hidden, :github_link)
        end

        def routing_error
            render :file => Rails.root.join("public", "404.html"), status => 404, :layout => true
        end
end
