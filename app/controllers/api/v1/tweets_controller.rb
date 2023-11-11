# frozen_string_literal: true

module Api
  module V1
    class TweetsController < ApplicationController
      before_action :authenticate_api_v1_user!
      before_action :tweet_image, only: [:create]
      before_action :offset_param, only: [:index]
      before_action :set_tweet, only: [:destroy]

      def index
        tweets = Tweet.all.order(created_at: 'DESC').includes(%i[user tweet_image]).limit(5).offset(@offset_params)
        total_count = Tweet.all.count.to_i
        render json: { tweets: tweets.as_json(methods: :image_url, include: { user: { include: { profile: { methods: :icon_image_url } } } }),
                       total_count: }
      end

      def show
        tweet = Tweet.find(params[:id])
        render json: { tweet: tweet.as_json(methods: :image_url, include: { user:
                                            { include: { profile: { methods: :icon_image_url } } } }) }
      end

      def create
        tweet = current_api_v1_user.tweets.build(tweet_params)
        tweet.tweet_image = @tweet_image if @tweet_image.present?
        if tweet.save
          render json: tweet
        else
          render status: :unprocessable_entity, json: { error: '不正な入力値です' }
        end
      end

      def destroy
        if @tweet.destroy
          render json: @tweet
        else
          render json: @tweet.errors, status: :unprocessable_entity
        end
      end

      private

      def tweet_image
        @tweet_image = TweetImage.find(params[:tweet_image_id]) if params[:tweet_image_id].present?
      end

      def tweet_params
        params.permit(:text)
      end

      def offset_param
        @offset_params = params[:offset]&.to_i
      end

      def set_tweet
        @tweet = Tweet.find(params[:id])
      end
    end
  end
end
