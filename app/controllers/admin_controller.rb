class AdminController < ApplicationController
    def index
        @projects = Project.all
        @publications = Publication.all
    end

    def show
        @project = Project.find_by( name: params[:id] )
        if not @project.nil? 
            @tags = Tag.where( project_name: params[:id])

            @description = render_to_string( inline: @project.description.html_safe)
            @introduction = render_to_string( inline: @project.introduction.html_safe)
            @main = render_to_string( inline: @project.main.html_safe)
            @results = render_to_string( inline: @project.results.html_safe)
            @currently = render_to_string( inline: @project.currently.html_safe)
            @resources = render_to_string( inline: @project.resources.html_safe)

        end
        @page_entity = @project
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new( project_params )

        if @project.save
            redirect_to admin_path( @project.name )
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @project = Project.find_by( name: params[:id] )
    end

    def update
        @project = Project.find_by( name: params[:id] )
        @tags = Tag.find_by( project_name: @project.name) 
        
        if @project.update( project_params )
            redirect_to admin_path( @project.name )
        else 
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @project = Project.find_by( name: params[:project_name] )
        @tags = Tag.find_by( project_name: params[:project_name] )
        if @tags
            @tags.destroy
        end
        @project.destroy

        redirect_to admin_index_path, status: :see_other
    end

    private
        def project_params
            params.require(:project).permit(:id, :name, :version, :stage, :description, :introduction, :main, :results, :currently, :resources, :github_link, :created_at, :updated_at, :hidden)
        end

        def routing_error
            render :file => Rails.root.join("public", "404.html"), status => 404, :layout => true
        end

end
