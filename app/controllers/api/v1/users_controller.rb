# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :offset_params, only: [:show]

      def show
        user = User.find(params[:id])
        user_tweets = user.tweets.order(created_at: 'DESC').includes(%i[user tweet_image]).limit(5).offset(@offset_params)
        render json: { userInfo: user, tweets: user_tweets.as_json(methods: :image_url, include: { user:
        { include: { profile: { methods: :icon_image_url } } } }),
                       profile: user.profile.as_json(methods: %i[header_image_url icon_image_url]) }
      end

      private

      def offset_params
        @offset_params = params[:offset]&.to_i
      end
    end
  end
end
