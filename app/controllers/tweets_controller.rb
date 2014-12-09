require './app/jobs/tweets_fetch_job'

class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  rescue_from TweetsFetchJobError::InvalidResponse, with: :show_error

  # GET /tweets
  def index
    # Retrieve count of unique tweets
    @tweets_count = Tweet.unscoped.group(:remote_id).count(:id)

    # Set counter and remove duplicates
    @tweets = Tweet.includes(:user).each {|t|
      t.counter = @tweets_count[t.remote_id]
    }.uniq(&:remote_id)
  end

  # GET /tweets/1
  def show
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to @tweet, notice: 'Tweet was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tweets/1
  def update
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: 'Tweet was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end

  def tweets_from_api
    TweetsFetchJob.perform_later
    redirect_to tweets_path, notice: 'Tweets fetched successfully.'
  end

  protected

    def show_error(exception)
      redirect_to tweets_path, notice: exception.message
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_params
      params.require(:tweet).permit(:message, :sentiment, :remote_id, :user_id)
    end
end
