class TagsController < ApplicationController
    def new
        @tag = Tag.new()
    end

    def create
        @tag = Tag.new( tag_parameters )
        if @tag.save
            if not @tag.project_name.nil?
                redirect_to admin_path( @tag.project_name )
            
            elsif not @tag.publication_name == "" or @tag.publication_name.nil?
                redirect_to adminpub_path ( @tag.publication_name )
            end
        else
            render admin, status: :unprocessable_entity
        end
    end

    def edit
        @tag = Tag.find( params[:id] )
    end

    def update
        @tag = Tag.find( params[:id] )
        
        if @tag.update( tag_parameters ) 
            if not @tag.project_name == ""
                redirect_to admin_path( @tag.project_name )
            elsif
                not @tag.publication_name == ""
                redirect_to adminpub_path( @tag.publication_name )
            end
        else 
            render admin_url( @tag.project_name ), status: :unprocessable_entity
        end
    end

    def destroy
        @tag = Tag.find_by( id: params[:id] )
        destroyed = @tag
        
        @tag.destroy
        if destroyed.project_name == ""
            redirect_to admin_path( destroyed.project_name ), status: :see_other
        else 
            redirect_to adminpub_path( destroyed.publication_name ), status: :see_other
        end
    end

    private
        def tag_parameters
            params.require(:tag).permit(:id, :name, :count, :project_name, :publication_name, :created_at, :updated_at)
        end
    
end
