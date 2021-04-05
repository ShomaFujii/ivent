class RoomsController < ApplicationController
  before_action :authenticate_user!, except:[:index,:show,:search]
  before_action :set_item, only:[:edit,:show,:destroy,:update]
  before_action :set_remove, only:[:edit,:update]

  def index
    @rooms = Room.order("created_at DESC")
 end

 def new
   @room = Room.new
 end

 def create
   @room = Room.new(room_params)
   if @room.save
     redirect_to root_path
   else
     render :new
   end
 end

 def show 
  @comment = Comment.new
  @comments = @room.comments.includes(:user)
  @review = Review.new
 end

 def edit

 end

 def destroy
  unless @room.user_id == current_user.id
    redirect_to action: :index
  end
  @room.destroy
  redirect_to root_path
 end

 def update

  if @room.update(room_params)
   redirect_to root_path
    
  else
   render :edit 
  end

 end

def search
  @rooms = Room.search(params[:keyword])
end

 private

 def set_remove
  unless @room.user_id == current_user.id
    redirect_to action: :index
  end
end

 def room_params
  params.require(:room).permit(:rent,:image,:address,:station,:date,:phone_number,:mail,:air_conditioner_id,:kitchen_id, :toilet_id,:bathroom_id,:pet_id,:discribe,:deposit,:price).merge(user_id: current_user.id)
 end

 def set_item
  @room = Room.find(params[:id])
end

end
