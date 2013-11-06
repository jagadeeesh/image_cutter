class ImagesController < ApplicationController
  def new
   @image=Image.new()
  end
  
  def index
  @image=Image.all
  end
  
  def show
   @image=Image.find(params[:id])
  
  end
  
  def edit
   @image=Image.find(params[:id])
   img = Magick::Image.read(@image.image.path).first
   @width = img.columns
   @height = img.rows
  end
  
  def update
   @image=Image.find(params[:id])
   img = Magick::Image.read(@image.image.path).first
   width=params[:width].to_i
   height=params[:height].to_i
   params[:image] = img.resize(width, height)
#=begin   
    if @image.update_attributes(image_params)
       redirect_to @image
    else
       render 'edit'
    end
   end
#=end
    
  def create
   @image=Image.new(image_params)
    if @image.save
     #flash.now[:success]="your data stored successfully"
     redirect_to  @image
    else
     render text:" stored"
    end 
  end
  def destroy
  @image=Image.find(params[:id]).destroy
  redirect_to :back
  end
  
  private
  def image_params
    params.require(:image).permit(:name, :email, :image)
  end
end
