class ReviewsController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @reviews = @room.reviews
  end
  
  def create
    @review = Review.new(review_params)
    @comment = Comment.new
    if @review.save
      redirect_to room_reviews_path(@review.room.id)
    else

      @room = @review.room
      @comments = @room.comments
      @reviews = @room.reviews
      render "rooms/show"
    end
  end
  

  private
  def review_params
    params.require(:review).permit(:score, :content).merge(user_id: current_user.id,room_id: params[:room_id])
  end
end
