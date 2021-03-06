class SongsController < ApplicationController
  def index
		@songs = Song.all
	end

	def new
		@song = Song.new
	end

	def create
		@song = Song.new(allowed_params)
		if @song.save
			redirect_to songs_path, notice: "El artista #{song.name} fue creado correctamente"
		else
			render :new
		end
	end

	def show
		@song = Song.find(params[:id])
	end

	def edit
		@song = Song.find(params[:id])
	end

	def update
		@song = Song.find(params[:id])
		if @song.update(allowed_params)
			redirect_to songs_path, notice: "El artista #{song.name} fue actualizado correctamente"
		else
			render :edit
		end
	end

def destroy
	song = Song.find(params[:id])
	song.destroy
	redirect_to songs_path, notice: "El artista #{song.name} fue eliminado correctamente"
end

	private

	def allowed_params
		params.require(:song).permit(:name, :number, :preview_url)
	end

end
