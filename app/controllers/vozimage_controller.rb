class VozimageController < ApplicationController
#after_filter :getimage
  before_action :authenticate_user!, except: [:index]
  def getimage
    @image = []
    @pbegin = params[:pbegin].to_s
    @pend = params[:pend].to_s
    if params[:p].to_s ==""
      @page = params[:link]
      Dir::Voz.layanh(@page,@pbegin,@pend)
    else
      @page = params[:p].to_s
      Dir::Voz.layanh(@page,@pbegin,@pend)
    end
    # if params[:pbegin].present? && params[:pend].present?
    #   params[:pbegin].
    # (params[:pbegin]..params[:pend]).each do |page|
    #   @keyword = "%" + @page + page.to_s + "%"
    #   @image += Hinhvoz.where('page like ?', @keyword).pluck(:image)
    # end
    # end
  end
  def index
  end
  def show
    @image = Hinhvoz.paginate(:page => params[:page])
  end
  def find
    if params[:search].present? && params[:page].present?
      @keyword = '%' +  params[:search].to_s + "&page=" + params[:page] + '%'
    @search= Hinhvoz.where('page like ?', @keyword)
    else
      @search = []
    end
  end
  def destroy
    @image = Hinhvoz.find(params[:id])
    @image.destroy

    redirect_to vozimage_path
  end
  def edit
  @image = Hinhvoz.find(params[:id])
  end
  def update
    @image = Hinhvoz.find(params[:id])
    @des_image = params[:des]
    if  @image.update_column(:des,@des_image)
      redirect_to vozimage_path
    else
    render 'edit'
    end
  end

  def saveimage
    @image = Hinhvoz.where('id like ?', params[:id]).pluck(:image)
    @id = params[:id]
    require 'open-uri'
    File.new("#{@id}.jpg", "w")
    directory = "/home/ducnghi/Downloads"
    open(@image.to_param) do |f|
        File.open(File.join(directory,"#{@id}.jpg"),"wb") do |file|
        file.puts f.read
      end
    end
    redirect_to vozimage_show_path
end
end



