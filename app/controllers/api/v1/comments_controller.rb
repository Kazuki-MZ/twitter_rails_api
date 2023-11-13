# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_api_v1_user!

      def create
        comment = current_api_v1_user.comments.build(comment_params)
        if comment.save
          render json: comment
        else
          render status: :unprocessable_entity, json: { error: '不正な入力値です' }
        end
      end

      private

      def comment_params
        params.permit(:context, :tweet_id)
      end
    end
  end
end
