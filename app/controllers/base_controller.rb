class BaseController < ApplicationController
	def index
		@projects = Project.order("RANDOM()").limit(3)
		@publications = Publication.order("RANDOM()").limit(3)
		@tags = Tag.all

		@latest_projects = Project.order(created_at: :desc).limit(3)
		@latest_publications = Publication.order(created_at: :desc).limit(3)
	end

	def about
	end

	def contact
	end
end
