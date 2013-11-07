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
      image=img.resize!(width, height)
      image.write(@image.image.path)
   redirect_to @image
   end
    
  def create
   
   @image=Image.new(image_params)
    if @image.save
     redirect_to  @image
    else
     render text:" stored"
    end 
  end
  
  def transform
    #binding.pry
    render text: params[:path]
   #image=open(params[:path],'User-Agent' => 'Test').read
   # File f=File.open("img1",'w')
   #  f.write(image)
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
