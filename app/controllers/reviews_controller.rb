class ReviewsController < ApplicationController
  before_action :set_list, only: [:create]

  def create
    @review = @list.reviews.build(review_params)
    if @review.save
      Rails.logger.debug "Review saved with rating: #{@review.rating}"
      redirect_to list_path(@list), notice: 'Review was successfully created.'
    else
      Rails.logger.debug "Review not saved. Errors: #{@review.errors.full_messages.join(", ")}"
      render 'lists/show'
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
