class AlbumsController < ApplicationController
  def new

  end
  
  def show
   @album=Album.find(params[:id])
   @pictures=@album.pictures
  end

end
