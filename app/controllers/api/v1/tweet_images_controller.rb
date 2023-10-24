# frozen_string_literal: true

module Api
  module V1
    class TweetImagesController < ApplicationController
      def create
        tweet_image = TweetImage.new
        tweet_image.image.attach(params[:tweet][:image])
        if tweet_image.save
          render json: tweet_image
        else
          render status: :unprocessable_entity, json: { error: '不正な入力です' }
        end
      end
    end
  end
end
