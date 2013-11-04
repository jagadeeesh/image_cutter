class ImagesController < ApplicationController
  def new
  @image=Image.new()
  end
  def index
  end
  def create
  @image=Image.new(image_params)
   if @image.save
    flash[:success]="your data stored successfully"
   redirect_to :back
   else
    render text:"not stored"
   end 
  end
  private
  def image_params
   params.require(:image).permit(:name, :email, :image)
  end
  
end
