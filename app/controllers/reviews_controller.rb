class ReviewsController < ApplicationController
    before_action :set_movie
    before_action :require_signin

    def index
        # @movie=Movie.find(params[:movie_id])
        @reviews = @movie.reviews
    end
    def new
        # @movie = Movie.find(params[:movie_id])
        @review = @movie.reviews.new
    end
    def create
        # @movie=Movie.find(params[:movie_id])
        @review=@movie.reviews.new(params_reviews)
        @review.user = current_user
        @review.save
        if @review.save
            redirect_to movie_reviews_path(@movie),notice: "Thank you for review!"
        else
            render :new 
        end
    end
    private

    def params_reviews
        params.require(:review).permit(:comment, :stars)
    end

    def set_movie
        # @movie=Movie.find(params[:movie_id])
        @movie = Movie.find_by!(slug: params[:movie_id])
    end
end
