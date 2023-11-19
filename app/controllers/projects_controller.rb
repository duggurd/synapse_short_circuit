class ProjectsController < ApplicationController  
	def index
		@projects = Project.all
		@tags = Tag.all
	end

	def show
		@project = Project.find_by( name: params[:id] )
		if not @project.nil?
			@tags = Tag.where( project_name: @project.name)

			@description = render_to_string( inline: @project.description.html_safe )
			@introduction = render_to_string( inline: @project.introduction.html_safe )
			@main = render_to_string( inline: @project.main.html_safe )
			@results = render_to_string( inline: @project.results.html_safe )
			@currently = render_to_string( inline: @project.currently.html_safe )
			@resources = render_to_string( inline: @project.resources.html_safe )
		end
		@page_entity = @project
	end

	def routing_error
		render :file => Rails.root.join("public", "404.html"), status => 404, :layout => true
	end

	private
		def project_params
			params.require(:project).permit(:id, :name, :version, :stage, :description, :introduction, :main, :results, :currently, :resources, :github_link, :created_at, :updated_at, :hidden)
		end
end
