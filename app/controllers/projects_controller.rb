class ProjectsController < ApplicationController
	def index
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			flash[:alert] = "Project has not been created."
			render "new"
		end
	end

	def show
		@project = Project.find(params[:id])
	end

	#để phương thức project_params ở chế độ private để tránh gọi nó như một action kì cục
	private
	def project_params
		params.require(:project).permit(:name, :description)
	end
end