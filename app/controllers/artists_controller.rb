class ArtistsController < ApplicationController
	def index
		@artists = Artist.all
	end

	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(allowed_params)
		if @artist.save
			redirect_to artists_path, notice: "El artista #{artist.name} fue creado correctamente"
		else
			render :new
		end
	end

	def show
		@artist = Artist.find(params[:id])
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
		@artist = Artist.find(params[:id])
		if @artist.update(allowed_params)
			redirect_to artists_path, notice: "El artista #{artist.name} fue actualizado correctamente"
		else
			render :edit
		end
	end

def destroy
	artist = Artist.find(params[:id])
	artist.destroy
	redirect_to artists_path, notice: "El artista #{artist.name} fue eliminado correctamente"
end

	private

	def allowed_params
		params.require(:artist).permit(:name, :image_url)
	end

end
