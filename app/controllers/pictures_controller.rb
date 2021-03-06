class PicturesController < ApplicationController
  def new
  @picture=Picture.new
  end

  def create
   @album=Album.new
   i=0
   params[:picture][:picture].each do
    @picture=@album.pictures.new()
    @picture.name=params[:picture][:name]
    @picture.picture=params[:picture][:picture][i]
    @picture.category_id=(params[:picture][:category_id])
    @picture.save
    i=i+1
    end
   @album.save
  redirect_to @album
  end
  
  def show
    @picture = Picture.find(params[:id])
    @picture_tags=Tagging.where(picture_id:@picture.id)
  end
  
  def allpict
   @tagall=Tag.all
   if params[:id]!=nil
    @category=Category.find(params[:id])
    @pictures=@category.pictures.paginate(:page => params[:page], :per_page => 24)
   else
    @pictures = Picture.paginate(:page => params[:page], :per_page => 24)
   end
  end
  
  def addtags
   @picture=Picture.find_by_id(params[:id])
   tagging=Tagging.new
   i=Tag.find_by_name(params[:tag])
    if !i
     tag=Tag.new()
     tag.name=params[:tag]
     tag.save
     tagging.tag_id=tag.id
     tagging.picture_id=@picture.id
     tagging.save
    else if !Tagging.find_by_tag_id_and_picture_id(i.id,@picture.id)
              tagging.tag_id=i.id
              tagging.picture_id=@picture.id
              tagging.save
         end
    end
   redirect_to @picture
  end

  def tag
   #a=params[:id]
   #@pictures=Picture.where(id: Tagging.find_all_by_tag_id(a).map{|u| u.picture_id})
   @pictures=Tag.find_by_id(params[:id]).picture
  end
  
  def abc
   @picture = Picture.find(params[:id])
  end

end
