class RoomsController < ApplicationController

  def index
  	@rooms = Room.all
  end

  def new
  	@room = Room.new
    @room.room_images.build
  end

  def create
  	@room = Room.new(room_params)
  	if @room.save
  		flash[:notice] = "物件が登録されました！"
  		redirect_to room_path(@room.id)
  	else
  		@room = Room.new(room_params)
      flash[:notice] = "正常に登録されていません。再度登録してください。"
  		render 'new'
  	end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def room_params
  	params.require(:room).permit(:name, :address, :condition, :link, :living_status, room_images_images: [])
  end

end
