class AlbumsController < ApplicationController
	def index
		@albums = Album.all
	end

	def new
		@album = Album.new
	end

	def create
		@album = Album.new(allowed_params)
		if @album.save
			redirect_to albums_path, notice: "El artista #{album.name} fue creado correctamente"
		else
			render :new
		end
	end

	def show
		@album = Album.find(params[:id])
	end

	def edit
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		if @album.update(allowed_params)
			redirect_to albums_path, notice: "El artista #{album.name} fue actualizado correctamente"
		else
			render :edit
		end
	end

def destroy
	album = Album.find(params[:id])
	album.destroy
	redirect_to albums_path, notice: "El artista #{album.name} fue eliminado correctamente"
end

	private

	def allowed_params
		params.require(:album).permit(:name, :image_url, :released_at)
	end

end
