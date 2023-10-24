# frozen_string_literal: true

module Api
  module V1
    class TweetsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :tweet_image, only: [:create]

      def create
        tweet = current_api_v1_user.tweets.build(tweet_params)
        tweet.tweet_image = @tweet_image if @tweet_image.present?
        if tweet.save
          render json: tweet
        else
          render status: :unprocessable_entity, json: { error: '不正な入力値です' }
        end
      end

      private

      def tweet_image
        @tweet_image = TweetImage.find(params[:tweet_image_id]) if params[:tweet_image_id].present?
      end

      def tweet_params
        params.permit(:text)
      end
    end
  end
end
